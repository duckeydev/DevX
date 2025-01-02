mv /scripts/configs/bashConfig /root/.bashrc
apt-get update && apt-get install -y bash && echo "source ~/.bashrc" >> /root/.bash_profile
