resource "proxmox_vm_qemu" "vm01" {
    vmid = 101
    name = "vm01"
    target_node = "pve"
    clone = "ubuntu2404-template"
    agent = 1
    os_type = "cloud-init"
    cpu {
      type    = "x86-64-v2-AES"
      cores       = 1
      sockets     = 1
    }
    memory = 2048
    scsihw = "virtio-scsi-single"
    disks {
        ide {
            ide3 {
                cloudinit {
                    storage = "local-lvm"
                }
            }
        }
        virtio {
            virtio0 {
                disk {
                    size            = "16G"
                    storage         = "local-lvm"
                    replicate       = true
                }
            }
        }
    }
    network {
      id     = 0
      model  = "virtio"
      bridge = "vmbr0"
    }
    boot = "order=virtio0"
    ipconfig0 = "ip=192.168.0.11/24,gw=192.168.0.1"
    nameserver = "8.8.8.8"
    ciuser = "user"
    cipassword = "password"
    sshkeys = "${file("~/.ssh/id_rsa.pub")}"
}
