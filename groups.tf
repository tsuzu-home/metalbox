# // Default matcher group for machines
# resource "matchbox_group" "default" {
#   name    = "default"
#   profile = matchbox_profile.flatcar-install.name
# }

# // Match install stage Flatcar Linux machines
# resource "matchbox_group" "stage-1" {
#   name    = "worker"
#   profile = matchbox_profile.worker.name

#   selector = {
#     os = "installed"
#   }
# }

module "laurel" {
  source   = "./k0snode"
  matchbox_http_endpoint = var.matchbox_http_endpoint
  matchbox_rpc_endpoint = var.matchbox_rpc_endpoint
  ssh_authorized_key = var.ssh_authorized_key
  flatcar_linux_version = "3815.2.1"
  hostname = "laurel"
  mac = "6c:4b:90:a2:79:85"
}

module "paprika" {
  source   = "./k0snode"
  matchbox_http_endpoint = var.matchbox_http_endpoint
  matchbox_rpc_endpoint = var.matchbox_rpc_endpoint
  ssh_authorized_key = var.ssh_authorized_key
  flatcar_linux_version = "3815.2.1"
  hostname = "paprika"
  mac = "58:47:ca:76:76:a2"
}
