# SSH In Docker is pain
# Im gonna sacrafice a cat preferably a cat named "Cyteon"
# to make this work

apt-get update && apt-get install -y openssh-server ufw # Install SSH and UFW
mkdir /var/run/sshd

echo 'root:root' | chpasswd # Supa Dupa Mega secure

rm /etc/ssh/sshd_config # So we can use the one in the /scripts/configs folder
mv /scripts/configs/sshdConfig_PPA /etc/ssh/sshd_config # This file is PasswordAuthentication yes
# mv //scripts/configs/sshdConfig_KA /etc/ssh/sshd_config # This file is PasswordAuthentication no AKA KeyAuthentication
chmod 0600 /etc/ssh/ssh_host_*
ufw allow ssh
# End of snippet