## Terraform-CoreOS-Ignition

### Overview
The aim of this sample project is that congiure new coreOS's version(1688.5.3 (stable)) using ignition with terraform on digitalocean provider.

It consists of etcd, flanneld and iptables service configurations for CI.

### Requirements
* Terraform must be intalled and configured
* You should have digitialocean token

### How To Use

Firstly, download project:

```
git clone https://github.com/yasinKIZILKAYA/Terraform-CoreOS-Ignition.git

```
You should add main.tfvars file for your environment variables in miya directory or you can configure Makefile according your requirements.That file should consist of the following environment variables:

```
"do_token" = "provided_by_digitialocean"
"ci_ip" = "ip_of_your_gitlab_runner"
"docker_port" = "your_docker_socket_port"
"ssh_keys"=["your_ssh_fingerprint"]

```
These the following Makefile commands are created your host on digitialocean:

```
make get
make plan
make apply
```
In addition, you can manage and apply your plans via ***make plan-output*** and ***make apply-plan [dir-or-plan]*** commands.

### Links
 * [Terraform](https://www.terraform.io/)
 * [CoreOS - Ignition](https://coreos.com/ignition/docs/latest/)


