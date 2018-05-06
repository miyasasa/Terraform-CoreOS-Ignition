output "miya-example_droplet_id" {
  value = "${digitalocean_droplet.miya-example.*.id}"
}

output "miya-example_droplet_name" {
  value = "${digitalocean_droplet.miya-example.*.name}"
}

output "miya-example_droplet_image" {
  value = "${digitalocean_droplet.miya-example.*.image}"
}

output "miya-example_droplet_ipv4_private" {
  value = "${digitalocean_droplet.miya-example.*.ipv4_address_private}"
}

output "miya-example_droplet_ipv4_public" {
  value = "${digitalocean_droplet.miya-example.*.ipv4_address}"
}

output "miya-example_droplet_status" {
  value = "${digitalocean_droplet.miya-example.*.status}"
}

output "miya-example_droplet_size" {
  value = "${digitalocean_droplet.miya-example.*.size}"
}

output "miya-example_droplet_disk" {
  value = "${digitalocean_droplet.miya-example.*.disk}"
}

output "miya-example_droplet_vcpus" {
  value = "${digitalocean_droplet.miya-example.*.vcpus}"
}
