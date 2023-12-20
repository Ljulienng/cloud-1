sudo apt update
sudo apt install -y python3 python3-pip
pip install --upgrade pip
sudo pip install docker-compose
# sudo apt-get install openssh-server
# sudo systemctl enable ssh
# sudo systemctl start ssh

mkdir -p /home/ubuntu/data/mariadb
mkdir -p /home/ubuntu/data/wordpress
pip install --upgrade urllib3
pip install --user 'requests'
export PATH=$PATH:/root/.local/bin
