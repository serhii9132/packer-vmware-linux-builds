## packer-vmware-linux-builds 

This repository contains configuration files for a fully unattended installation of the following operating systems:
- Debian 13
- Ubuntu 24.04 LTS 
- AlmaLinux 8.10

### Template details:
- CPU: 4 cores
- Disk: 50 Gb
- Type disk: growable virtual disk contained in a single file
- RAM: 4 Gb
- Firmware: EFI
- Root: enabled

### Usage
1. Create a local.pkrvars.hcl file in the project root directory with the following content:
 ```sh
password = "$6$Passwird23432"
ssh_private_key_file = "D://path//to//key//key.pem"
ssh_public_key="ssh-ed25519 AAAA11112222333....."

 ```
2. Run the following commands:
```sh
make debian-13
make ubuntu-24
```
After execution, the VMware virtual machine files will appear in artifacts/${var.vm_name}/${current_timestamp}.