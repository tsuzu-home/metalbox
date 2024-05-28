module "laurel" {
  source   = "./k0snode"
  matchbox_http_endpoint = var.matchbox_http_endpoint
  matchbox_rpc_endpoint = var.matchbox_rpc_endpoint
  ssh_authorized_keys = var.ssh_authorized_keys
  flatcar_linux_version = "3815.2.1"
  hostname = "laurel"
  mac = "6c:4b:90:a2:79:85"
  ip = "10.24.0.133/24"
  profile = "flatcar-running"
  nic = "enp*"
}

module "paprika" {
  source   = "./k0snode"
  matchbox_http_endpoint = var.matchbox_http_endpoint
  matchbox_rpc_endpoint = var.matchbox_rpc_endpoint
  ssh_authorized_keys = var.ssh_authorized_keys
  flatcar_linux_version = "3941.0.0"
  hostname = "paprika"
  mac = "58:47:ca:76:76:a2"
  ip = "10.24.0.134/24"
  profile = "flatcar-running"
  nic = "enp2s0f1"
}
