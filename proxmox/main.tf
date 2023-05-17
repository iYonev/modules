variable "proxmox_api_endpoint" {
  type = string
}

variable "proxmox_api_token_id" {
  type = string
}

variable "proxmox_api_token_secret" {
  type = string
}

variable "virtual_machines" {
  type        = map
  default     = {}
  description = "Identifies the object of virtual machines."
}

resource "proxmox_vm_qemu" "virtual_machines" {
  for_each         = var.virtual_machines

  name             = each.value.name
  desc             = each.value.description
  target_node      = each.value.target_node
  os_type          = each.value.os_type
  full_clone       = each.value.full_clone
  clone            = each.value.template
  agent            = each.value.agent
  memory           = each.value.memory
  sockets          = each.value.socket
  cores            = each.value.cores
# ipconfig0        = "ip=${each.value.ip_address}/32,gw=${each.value.gateway}"
  automatic_reboot = each.value.automatic_reboot
  vmid            = each.value.vm_id

  disk {
    storage      = each.value.storage
    type         = each.value.disk_type
    size         = each.value.storage_size
  }

  network {
    bridge   = each.value.network_bridge_type
    model    = each.value.network_model
    firewall = each.value.network_firewall
    tag      = each.value.network_tag
  }
}


