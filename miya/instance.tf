#===========================
# Digitalocean Droplets
#===========================

resource "digitalocean_droplet" "miya-example" {
  count              = "${var.do_droplet_count}"
  name               = "${var.do_droplet_prefix}-srv-${count.index + 1}"
  size               = "${var.do_droplet_size}"
  image              = "${var.do_droplet_image}"
  region             = "${var.do_region}"
  ssh_keys           = "${var.ssh_keys}"
  user_data          = "${data.ignition_config.miya-example.rendered}"
  private_networking = "${var.enable_private_networking}"

  lifecycle {
    create_before_destroy = true
  }
}
