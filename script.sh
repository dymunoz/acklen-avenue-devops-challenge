#!/bin/bash
apt-get install -y software-properties-common
apt-add-repository ppa:ansible/ansible

apt-get update
apt-get install -y ansible
apt-get install -y git

curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

git clone https://github.com/dymunoz/ansible-node-js.git /home/ubuntu/ansible-node-js
cd /home/ubuntu/ansible-node-js
ansible-playbook -b -i hosts setup.yml --connection=local

