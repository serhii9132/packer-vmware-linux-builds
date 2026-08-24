locals {
    build_timestamp = formatdate("YYYY-MM-DD_hh-mm", timestamp())
    artifacts_output_directory = "${path.cwd}/artifacts/${var.vm_name}/${local.build_timestamp}"

    cd_label = "cidata"
}

variable "version" {
    type = number
}

variable "firmware" {
    type = string
}

variable "is_headless" {
    type = bool
}

variable "is_skip_export" {
    type = bool
}

variable "is_vmx_remove_ethernet_interfaces" {
    type = bool
}

variable "cpu_cores" {
    type = number
}

variable "memory" {
    type = number
}

variable "disk_size" {
    type = number
}

variable "disk_type_id" {
    type = number
}

variable "disk_adapter_type" {
    type = string
}

variable "network_adapter_type" {
    type = string
}

variable "communicator" {
    type = string
}

variable "cdrom_adapter_type" {
    type = string
}

variable "guest_os_type" {
    type = string
}

variable "vm_name" {
  type = string
}

variable "iso_target_path" {
  type = string
}

variable "iso_checksum" {
  type = string
}

variable "iso_url" {
  type = string
}

variable "iso_name" {
  type = string
}

variable "boot_wait" {
    type = string
}

variable "boot_command" {
    type = list(string)
}

variable "shutdown_command" {
    type = string
}

variable "vnc_bind_address" {
  type = string
}

variable "vnc_port_min" {
  type = number
}

variable "vnc_port_max" {
  type = number
}

variable "is_vnc_disable_password" {
  type = bool
}

variable "ssh_username" {
  type = string
}

variable "ssh_public_key" {
  type = string
}

variable "ssh_private_key_file" {
  type = string
}

variable "ssh_timeout" {
  type = string
}

variable "password" {
  type = string
}

variable "vm_hostname" {
  type = string
}