# sprint11
Использование Terraform для создание виртуальных машин в Proxmox Virtual Environment и последующая настройкая с помощью Ansible.

Запустить на Proxmox Virtual Environment скрипт, который скачает образ Ubuntu Server 24.04 и создатст из него шаблон в Proxmox

```bash
ssh root@pve.local 'bash -s' < /home/user/cloud-init.sh
```

Перейти в директорию Terraform и запустить процесс создания виртуальных машин

```bash
cd terraform
terraform apply
```

Перейти в директорию Ansible и запустить Playbook

```bash
cd ../ansible
ansible-playbook playbook.yaml
```
