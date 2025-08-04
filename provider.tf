provider "matchbox" {
  endpoint    = var.matchbox_rpc_endpoint
  client_cert = file("./credentials/client.crt")
  client_key  = file("./credentials/client.key")
  ca          = file("./credentials/ca.crt")
}

terraform {
  required_providers {
    ct = {
      source  = "poseidon/ct"
      version = "0.13.0"
    }
    matchbox = {
      source  = "poseidon/matchbox"
      version = "0.5.4"
    }
  }
}
