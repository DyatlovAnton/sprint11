terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc07"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
  pm_tls_insecure     = true
}

variable "proxmox_api_url" {
  type        = string
  description = "https://pve.local:8006/api2/json"
}

variable "proxmox_api_token_id" {
  type        = string
  description = "root@pam!token01"
}

variable "proxmox_api_token_secret" {
  type        = string
  description = "Секретный ключ API токена"
  sensitive   = true
}
