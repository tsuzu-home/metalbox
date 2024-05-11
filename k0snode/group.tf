resource "matchbox_group" "group" {
  name    = var.hostname
  profile = local.profiles[var.profile]

  selector = {
    mac = var.mac
  }
}

locals {
    profiles = {
        "flatcar-running" = matchbox_profile.flatcar-running.name
        "flatcar-wipe" = matchbox_profile.flatcar-wipe.name
    }
}
