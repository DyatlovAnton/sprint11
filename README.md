# sprint11
Использование Terraform и Ansible для создания и настройки виртуальных машин в Proxmox Virtual Environment.

Запустить на Proxmox Virtual Environment скрипт, который скачает образ Ubuntu Server 24.04 и создаст из него шаблон в Proxmox

```bash
ssh root@pve.local 'bash -s' < cloud-init.sh
```

Перейти в директорию Terraform и запустить процесс создания виртуальных машин

```bash
cd terraform
terraform apply
```

Перейти в директорию Ansible и запустить Playbook для настройки виртуальных машин в Proxmox

```bash
cd ../ansible
ansible-playbook playbook.yaml
```
