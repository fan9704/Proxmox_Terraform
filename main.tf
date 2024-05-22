# Proxmox Full-Clone
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "vm-resource-demo1" {

    # VM General Settings
    target_node = "node1" # Change to deploy node
    name = "tf-ubuntu-${count.index + 1}"
    desc = "由 IaC 建立的 Ubuntu VM ${count.index + 1}"

    # VM Advanced General Settings
    onboot = false

    # VM OS Settings
    clone = "ubuntu-2204-cloudinit-template"
    # VM Cloud-Init Settings
    os_type = "cloud-init"

    # VM System Settings
    agent = 1

    # VM CPU Settings
    cores = 2 
    sockets = 1
    cpu = "host"    

    # VM Memory Settings
    memory = 4096

    # VM Network Settings
    network {
        bridge = "vmbr1" # Use VLAN
        model  = "virtio"
    }

    disk {
        storage = "share-nas"
        type = "sata"
        size = "100G"
    }




    # Default User
    ciuser = "root"
    # Add your SSH KEY
    # sshkeys = <<EOF
    # ssh-rsa XXXXXXXXXXX
    # EOF

}