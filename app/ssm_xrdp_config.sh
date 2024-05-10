#!/bin/bash

# Install python3 
# required for SSM agent operations
sudo dnf install python3

# Install Amazon SSM agent
cd /tmp
sudo dnf install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm

# Start and enable the Amazon SSM agent service
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent

# Install server with GUI
yum grouplist
yum group install "Server with GUI" -y --nobest

# Install TigerVNC"
yum install tigervnc-server -y


# Download & install latest epel package 
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
sudo yum install epel-release-latest-9.noarch.rpm

# Update yum & reboot
yum -y update
sudo reboot

# Install & start xrdp
yum install xrdp -y
systemctl start xrdp.service
systemctl status xrdp.service

# Check xrdp service port
netstat -tnlp

# Add port to firewall
firewall-cmd --permanent --add-port=3389/tcp
firewall-cmd --reload
systemctl status firewalld
sudo firewall-cmd --zone=public --list-ports | grep 3389

# Set the root password
passwd root


