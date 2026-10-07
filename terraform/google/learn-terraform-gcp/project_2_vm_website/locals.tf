locals {
  # A VM-specific tag limits the HTTP rule to matching instances.
  http_tag = "${var.vm_name}-allow-http"

  network_name = google_compute_network.vpc_network.name

  ssh_tag = "${var.vm_name}-iap-ssh"
}