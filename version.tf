terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.11"
    }
  }
  required_version = ">= 0.13"
}
provider "proxmox" {
  pm_api_url          = "${var.proxmox_api_endpoint}/api2/json"
  pm_api_token_id     =  "${var.proxmox_api_token_id}"
  pm_api_token_secret = "${var.proxmox_api_token_secret}"
  pm_tls_insecure     = true
  pm_debug            = true
}
~   
