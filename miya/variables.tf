variable "do_token" {
  description = "Digital ocean api token"
}

variable "do_region" {
  default     = "fra1"
  description = "DigitalOcean region"
}

variable "ssh_keys" {
  # The array of ssh keys fingerprint
  default     = []
  description = "ssh keys will be used in droplets"
}

variable "do_droplet_count" {
  default     = 1
  description = "Droplet count"
}

variable "do_droplet_prefix" {
  default     = "miya.example.org"
  description = "Droplet prefix for all example.org resources"
}

variable "do_droplet_size" {
  default     = "1gb"
  description = "Droplet memory size"
}

variable "do_droplet_image" {
  default     = "coreos-stable"
  description = "Droplet image"
}

variable "ci_ip" {
  description = "Gitlab ci runner ip for docker remote access"
}

variable "docker_port" {
  description = "Docker API port for remote access"
}

variable "enable_private_networking" {
  default     = true
  description = "DO droplet private_networking enable/disable flag"
}
