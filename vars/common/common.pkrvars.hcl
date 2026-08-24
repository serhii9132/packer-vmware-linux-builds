version = 22
firmware = "efi"
is_headless = true
is_skip_export = true
is_vmx_remove_ethernet_interfaces = true

cpu_cores = 2
memory = 4096
disk_size = 50000
disk_type_id = 0
disk_adapter_type = "nvme"
network_adapter_type = "vmxnet3"
communicator = "ssh"
cdrom_adapter_type = "sata"

tools_mode = "attach"
tools_source_path = "C:/Program Files (x86)/VMware/VMware Workstation/windows.iso"

iso_target_path = "./iso"

vnc_bind_address = "127.0.0.1"
vnc_port_min = 5960
vnc_port_max = 5960
is_vnc_disable_password = true

ssh_username = "root"
ssh_timeout = "2h"

boot_wait = "5s"
shutdown_command = "shutdown -P now"