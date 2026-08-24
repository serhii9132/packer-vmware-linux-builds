iso_checksum = "file:https://releases.ubuntu.com/noble/SHA256SUMS"
iso_url = "https://releases.ubuntu.com/noble"
iso_name = "ubuntu-24.04.3-live-server-amd64.iso"

vm_name = "ubuntu-24"
guest_os_type = "ubuntu-64"
vm_hostname = "ubuntu"

boot_command = [
    "e<wait>",
    "<down><down><down>",
    "<end><bs><bs><bs><bs><wait>",
    "ipv6.disable=1 <wait5>autoinstall ---<wait>",
    "<f10><wait>" 
]