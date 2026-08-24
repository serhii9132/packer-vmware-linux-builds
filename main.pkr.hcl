packer {
  required_plugins {
    vmware = {
      version = "2.1.1"
      source  = "github.com/vmware/vmware"
    }
    vagrant = {
      source  = "github.com/hashicorp/vagrant"
      version = "1.1.7"
    }
  }
}

source "vmware-iso" "base-linux" {
  version                         = var.version
  firmware                        = var.firmware
  headless                        = var.is_headless
  vmx_remove_ethernet_interfaces  = var.is_vmx_remove_ethernet_interfaces
  skip_export                     = var.is_skip_export

  cpus                            = var.cpu_cores
  cores                           = var.cpu_cores
  memory                          = var.memory
  network_adapter_type            = var.network_adapter_type
  disk_size                       = var.disk_size
  disk_type_id                    = var.disk_type_id
  disk_adapter_type               = var.disk_adapter_type

  cdrom_adapter_type              = var.cdrom_adapter_type
  iso_url                         = "${var.iso_url}/${var.iso_name}"
  iso_checksum                    = var.iso_checksum
  iso_target_path                 = abspath("${var.iso_target_path}/${var.iso_name}") 
  output_directory                = abspath("${local.artifacts_output_directory}")

  communicator                    = var.communicator
  cd_label                        = local.cd_label

  vnc_bind_address                = var.vnc_bind_address
  vnc_port_min                    = var.vnc_port_min
  vnc_port_max                    = var.vnc_port_max
  vnc_disable_password            = var.is_vnc_disable_password

  ssh_username                    = var.ssh_username
  ssh_timeout                     = var.ssh_timeout
  ssh_private_key_file            = var.ssh_private_key_file

  boot_wait                       = var.boot_wait
  boot_command                    = var.boot_command
  shutdown_command                = var.shutdown_command
}

build{
  source "source.vmware-iso.base-linux" {
      name                = "ubuntu-24"
      guest_os_type       = var.guest_os_type
      vm_name             = var.vm_name
      cd_content          = {
        "/meta-data" = file(abspath("${path.root}/unattend/${var.vm_name}/meta-data"))
        "/user-data" = templatefile(abspath("${path.root}/unattend/${var.vm_name}/user-data.pkrtpl.hcl"), { var = var })
      }
  }

  source "source.vmware-iso.base-linux" {
      name                = "debian-13"
      guest_os_type       = var.guest_os_type
      vm_name             = var.vm_name
      cd_content          = {
        "/preseed.cfg" = templatefile(abspath("${path.root}/unattend/${var.vm_name}/preseed.cfg.pkrtpl.hcl"), { var = var })
      }
  }

  provisioner "file" {
    source      = "${path.root}/provision/files/reconfigure_ssh_host_keys.service"
    destination = "/tmp/reconfigure_ssh_host_keys.service"
  }

  provisioner "shell" {
    scripts = [
      "${path.root}/provision/scripts/reconfigure_ssh_host_keys.sh",
      "${path.root}/provision/scripts/cleanup.sh"
    ]
  }

  post-processor "vagrant" {
    keep_input_artifact  = true
    output               = "${local.artifacts_output_directory}/${var.vm_name}.box"
  }
}
