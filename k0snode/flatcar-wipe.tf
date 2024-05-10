// Profile to set an SSH authorized key on first boot from disk
resource "matchbox_profile" "wipe-filesystem" {
  name         = "wipe-filesystem"
  kernel = "/assets/flatcar/${var.flatcar_linux_version}/flatcar_production_pxe.vmlinuz"
  initrd = [
    "/assets/flatcar/${var.flatcar_linux_version}/flatcar_production_pxe_image.cpio.gz",
  ]

  args = [
    "initrd=flatcar_production_pxe_image.cpio.gz",
    "flatcar.config.url=${var.matchbox_http_endpoint}/ignition?uuid=$${uuid}&mac=$${mac:hexhyp}",
    "flatcar.first_boot=yes",
  ]

  raw_ignition = data.ct_config.wipe-filesystem.rendered
}

data "ct_config" "wipe-filesystem" {
  content = templatefile("k0snode/butane/flatcar-wipe.yaml", {
    ssh_authorized_key = var.ssh_authorized_key
    main_disk = "/dev/nvme0n1"
  })
  strict = true
}
