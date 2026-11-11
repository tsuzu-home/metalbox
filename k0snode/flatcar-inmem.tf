resource "matchbox_profile" "flatcar-inmem" {
  name         = "flatcar-inmem-${var.hostname}"
  kernel = "/assets/flatcar/${var.flatcar_linux_version}/flatcar_production_pxe.vmlinuz"
  initrd = [
    "/assets/flatcar/${var.flatcar_linux_version}/flatcar_production_pxe_image.cpio.gz",
  ]

  args = [
    "initrd=flatcar_production_pxe_image.cpio.gz",
    "flatcar.config.url=${var.matchbox_http_endpoint}/ignition?uuid=$${uuid}&mac=$${mac:hexhyp}",
    "flatcar.first_boot=yes",
  ]

  raw_ignition = data.ct_config.flatcar-inmem.rendered
}

data "ct_config" "flatcar-inmem" {
  content = templatefile("k0snode/butane/flatcar-inmem.yaml", {
    ssh_authorized_keys = var.ssh_authorized_keys
    main_disk = var.main_disk
  })
  strict = true
}
