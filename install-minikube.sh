#!/bin/sh

username="mayas"

apt update
apt -y upgrade

apt update
apt -y install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst virt-manager
systemctl is-active libvirtd
usermod -aG libvirt "$username"
usermod -aG kvm "$username"
apt -y install socat conntrack
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
rm get-docker.sh
usermod -aG docker "$username"
systemctl start docker
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube-linux-amd64
mv minikube-linux-amd64 /usr/bin/minikube
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x kubectl
mv kubectl /usr/bin/kubectl
echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables
systemctl enable docker.service
systemctl enable kubelet.service