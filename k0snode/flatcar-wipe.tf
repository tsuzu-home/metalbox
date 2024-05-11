resource "matchbox_profile" "flatcar-wipe" {
  name         = "flatcar-wipe-${var.hostname}"
  kernel = "/assets/flatcar/${var.flatcar_linux_version}/flatcar_production_pxe.vmlinuz"
  initrd = [
    "/assets/flatcar/${var.flatcar_linux_version}/flatcar_production_pxe_image.cpio.gz",
  ]

  args = [
    "initrd=flatcar_production_pxe_image.cpio.gz",
    "flatcar.config.url=${var.matchbox_http_endpoint}/ignition?uuid=$${uuid}&mac=$${mac:hexhyp}",
    "flatcar.first_boot=yes",
  ]

  raw_ignition = data.ct_config.flatcar-wipe.rendered
}

data "ct_config" "flatcar-wipe" {
  content = templatefile("k0snode/butane/flatcar-wipe.yaml", {
    ssh_authorized_key = var.ssh_authorized_key
    main_disk = "/dev/nvme0n1"
  })
  strict = true
}
