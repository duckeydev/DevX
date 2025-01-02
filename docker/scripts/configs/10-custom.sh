#!/bin/bash

# Get container stats
CONTAINER_CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4"%"}')
CONTAINER_MEM=$(free -m | awk '/Mem:/ {print $3"MB / "$2"MB"}')
CONTAINER_DISK=$(df -h / | awk '/\// {print $3" / "$2}')

# Get host stats
HOST_CPU=$(cat /proc/stat | awk '/^cpu / {printf("%.2f%", ($2+$4)*100/($2+$4+$5))}')
HOST_MEM=$(free -m | awk '/Mem:/ {print $3"MB / "$2"MB"}')
HOST_DISK=$(df -h /host | awk '/\// {print $3" / "$2}')
HOST_TEMP=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null | awk '{print $1/1000"°C"}')

# Get the code-server password
PASSWORD=$(cat ~/.config/code-server/config.yaml | grep password | awk '{print $2}')

# Display Banner
echo "----------------------------------------------------------------"
echo " 🚀 Welcome to CloudableOS"
echo " 🚀 The most flexable dev environment powered by docker"
echo "----------------------------------------------------------------"
echo "Container CPU Usage : $CONTAINER_CPU"
echo "Container Memory    : $CONTAINER_MEM"
echo "Container Disk      : $CONTAINER_DISK"
echo "----------------------------------------------------------------"
echo "Host CPU Usage      : $HOST_CPU"
echo "Host Memory         : $HOST_MEM"
echo "Host Disk           : $HOST_DISK"
echo "Host Temperature    : ${HOST_TEMP:-N/A}"
echo "----------------------------------------------------------------"
echo ""
echo "Default SSH Password is: root"
echo "Code-Server Password is: ${PASSWORD:-N/A}"
echo "----------------------------------------------------------------"
echo " 🚀 CloudableOS Dev tools installer"
echo "----------------------------------------------------------------"
bash /scripts/installerMenu.sh