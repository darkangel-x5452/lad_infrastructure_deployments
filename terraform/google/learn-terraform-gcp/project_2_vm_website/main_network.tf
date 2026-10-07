resource "google_compute_network" "vpc_network" {
  name = var.terraform_network_name
}

resource "google_compute_firewall" "allow_iap_ssh" {
  name        = local.ssh_tag
  project     = var.project_id
  description = "Allow SSH to the website VM through Google Cloud IAP"

  # Use the same VPC network as the VM.
  network = local.network_name

  direction = "INGRESS"
  priority  = 1000

  # Google Cloud IAP TCP forwarding source range.
  source_ranges = ["35.235.240.0/20"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # Must match the network tag attached to the VM.
  target_tags = [local.ssh_tag]
}

# Equivalent network access to selecting "Allow HTTP traffic".
resource "google_compute_firewall" "allow_http" {
  name        = local.http_tag
  description = "Allow public HTTP access to ${var.vm_name}"
  network     = local.network_name

  direction = "INGRESS"
  priority  = 1000

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  # Allow connections from any IPv4 address.
  source_ranges = ["0.0.0.0/0"]

  # Apply this rule only to VMs with the matching network tag.
  target_tags = [local.http_tag]
}
