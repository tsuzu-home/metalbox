variable "matchbox_http_endpoint" {
  type        = string
  description = "Matchbox HTTP read-only endpoint (e.g. http://matchbox.example.com:8080)"
}

variable "matchbox_rpc_endpoint" {
  type        = string
  description = "Matchbox gRPC API endpoint, without the protocol (e.g. matchbox.example.com:8081)"
}

variable "ssh_authorized_key" {
  type        = string
  description = "SSH public key to set as an authorized_key on machines"
}

variable "flatcar_linux_version" {
  type        = string
  description = "Flatcar Linux version to use"
}

variable "hostname" {
  type        = string
  description = "Hostname to set on the machine"
}

variable "mac" {
  type        = string
  description = "MAC address of the machine"
}

variable "profile" {
  type        = string
  description = "profile to use"
}
