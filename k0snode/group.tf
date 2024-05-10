resource "matchbox_group" "group" {
  name    = var.hostname
  profile = matchbox_profile.flatcar-running.name

  selector = {
    mac = var.mac
  }
}
