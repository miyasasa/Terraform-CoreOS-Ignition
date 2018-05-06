#===========================
# Ignition config for CoreOS
#===========================

##==== Etcd configuration ====##
data "ignition_systemd_unit" "etcd_member_service" {
  name = "etcd-member.service"

  dropin {
    name    = "20-clct-etcd-member.conf"
    content = "${file("${path.module}/resources/20-clct-etcd-member.conf")}"
  }
}

##==== Flanneld Service configuration ====##
data "ignition_systemd_unit" "flanneld_service" {
  name = "flanneld.service"

  dropin {
    name    = "50-network-config.conf"
    content = "${file("${path.module}/resources/flanneld.service")}"
  }
}

##==== Docker Socket Configuration ====##
data "ignition_systemd_unit" "docker_tcp_socket" {
  name    = "docker-tcp.socket"
  content = "${data.template_file.docker_tcp_socket_file.rendered}"
}

data "template_file" "docker_tcp_socket_file" {
  template = "${file("${path.module}/resources/docker-tcp.socket")}"

  vars {
    docker_port = "${var.docker_port}"
  }
}

##==== Iptables Configuration ====##
data "ignition_systemd_unit" "iptables_restore_service" {
  name    = "iptables-restore.service"
  content = "${file("${path.module}/resources/iptables-restore.service")}"
}

data "ignition_file" "iptables" {
  filesystem = "root"
  path       = "/var/lib/iptables/rules-save"

  content {
    content = "${data.template_file.iptables_file.rendered}"
  }
}

data "template_file" "iptables_file" {
  template = "${file("${path.module}/resources/iptables.txt")}"

  vars {
    ci_ip       = "${var.ci_ip}"
    docker_port = "${var.docker_port}"
  }
}

data "ignition_config" "miya-example" {
  files = [
    "${data.ignition_file.iptables.id}",
  ]

  systemd = [
    "${data.ignition_systemd_unit.etcd_member_service.id}",
    "${data.ignition_systemd_unit.flanneld_service.id}",
    "${data.ignition_systemd_unit.docker_tcp_socket.id}",
    "${data.ignition_systemd_unit.iptables_restore_service.id}",
  ]
}
