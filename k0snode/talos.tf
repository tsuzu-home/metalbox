# Talos Linux provisioning profiles (added for laurel's switch from Flatcar).
# Boot assets are the official Talos v1.14.5 release binaries, served over
# plain HTTP from the muse-agent container (10.24.0.31) on the server LAN,
# since the matchbox assets dir on the router holds only Flatcar images.
# "talos-maintenance" boots Talos into maintenance mode (no config): the
# node is then installed with talosctl apply-config, after which the group
# profile should be switched to "local-boot" so the machine boots its disk.
resource "matchbox_profile" "talos-maintenance" {
  name   = "talos-maintenance-${var.hostname}"
  kernel = "http://10.24.0.31:18080/vmlinuz-amd64"
  initrd = [
    "http://10.24.0.31:18080/initramfs-amd64.xz",
  ]

  args = [
    "initrd=initramfs-amd64.xz",
    "talos.platform=metal",
    "console=tty0",
    "init_on_alloc=1",
    "slab_nomerge",
    "pti=on",
    "consoleblank=0",
    "nvme_core.io_timeout=4294967295",
    "printk.devkmsg=on",
  ]
}

resource "matchbox_profile" "local-boot" {
  name = "local-boot-${var.hostname}"

  generic_config = <<-EOT
    #!ipxe
    sanboot --no-describe --drive 0x80
  EOT
}
