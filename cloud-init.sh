#!/bin/bash

apt update
apt install -y libguestfs-tools
cd /var/lib/vz/template/iso/
wget https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
virt-customize -a noble-server-cloudimg-amd64.img --install qemu-guest-agent
qm create 100 --name template --cpu host --sockets 1 --cores 1 --memory 2048 --numa 1 --net0 virtio,bridge=vmbr0 --ostype l26 --agent 1 --scsihw virtio-scsi-single
qm set 100 --virtio0 local-lvm:0,import-from=/var/lib/vz/template/iso/noble-server-cloudimg-amd64.img
qm set 100 --ide2 local-lvm:cloudinit --boot order=virtio0
qm set 100 --ipconfig0 ip=dhcp
qm set 100 --ciupgrade 1 --ciuser user --cipassword password
qm cloudinit update 100
qm set 100 --name "ubuntu2404-template"
qm template 100
