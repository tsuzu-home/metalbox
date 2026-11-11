module "laurel" {
  source   = "./k0snode"
  matchbox_http_endpoint = var.matchbox_http_endpoint
  matchbox_rpc_endpoint = var.matchbox_rpc_endpoint
  ssh_authorized_keys = var.ssh_authorized_keys
  flatcar_linux_version = "3815.2.1"
  hostname = "laurel"
  mac = "6c:4b:90:a2:79:85"
  ip = "10.24.0.133/24"
  profile = "local-boot"
  nic = "enp*"
}

module "paprika" {
  source   = "./k0snode"
  matchbox_http_endpoint = var.matchbox_http_endpoint
  matchbox_rpc_endpoint = var.matchbox_rpc_endpoint
  ssh_authorized_keys = var.ssh_authorized_keys
  flatcar_linux_version = "4344.0.0"
  hostname = "paprika"
  mac = "58:47:ca:76:76:a2"
  ip = "10.24.0.134/24"
  profile = "local-boot"
  nic = "enp2s0f1np1"
}

module "vanilla" {
  source   = "./k0snode"
  matchbox_http_endpoint = var.matchbox_http_endpoint
  matchbox_rpc_endpoint = var.matchbox_rpc_endpoint
  ssh_authorized_keys = var.ssh_authorized_keys
  flatcar_linux_version = "4344.0.0"
  hostname = "vanilla"
  mac = "58:47:ca:70:61:7a"
  ip = "10.24.0.128/24"
  profile = "flatcar-running"
  nic = "enp*"
}

module "yuzukosho" {
  source   = "./k0snode"
  matchbox_http_endpoint = var.matchbox_http_endpoint
  matchbox_rpc_endpoint = var.matchbox_rpc_endpoint
  ssh_authorized_keys = var.ssh_authorized_keys
  flatcar_linux_version = "4344.0.0"
  hostname = "yuzukosho"
  mac = "38:05:25:32:0f:04"
  ip = "10.24.0.137/24"
  profile = "flatcar-running"
  nic = "enp196s0"
  main_disk = "/dev/nvme0n1"
  lvm_disk = "/dev/nvme1n1"
}
