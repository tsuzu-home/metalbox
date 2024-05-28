resource "matchbox_profile" "flatcar-running" {
  name   = "flatcar-running-${var.hostname}"
  kernel = "/assets/flatcar/${var.flatcar_linux_version}/flatcar_production_pxe.vmlinuz"
  initrd = [
    "/assets/flatcar/${var.flatcar_linux_version}/flatcar_production_pxe_image.cpio.gz",
  ]

  args = [
    "initrd=flatcar_production_pxe_image.cpio.gz",
    "flatcar.config.url=${var.matchbox_http_endpoint}/ignition?uuid=$${uuid}&mac=$${mac:hexhyp}",
    "flatcar.first_boot=yes",
    "root=LABEL=ROOT",
  ]

  raw_ignition = data.ct_config.running.rendered
}

data "ct_config" "running" {
  content = templatefile("k0snode/butane/flatcar-running.yaml", {
    matchbox_http_endpoint = var.matchbox_http_endpoint
    ssh_authorized_keys    = var.ssh_authorized_keys
    host_name              = var.hostname
    ip                     = var.ip
    nic                    = var.nic
  })
  strict = true
}
