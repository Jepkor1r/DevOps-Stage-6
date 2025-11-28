resource "linode_instance" "devops" {
  label  = "devops-app"
  region = var.region
  type   = var.instance_type
  image  = "linode/ubuntu22.04"
  root_pass = var.root_pass

  authorized_keys = [
    var.ssh_public_key
  ]
}

resource "local_file" "ansible_inventory" {
  filename = "../ansible/inventory.ini"
  content = templatefile("${path.module}/inventory.tpl", {
    server_ip = linode_instance.devops.ip_address
  })
}