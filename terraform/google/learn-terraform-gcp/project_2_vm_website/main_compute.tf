# Create the server VM.
resource "google_compute_instance" "server" {
  name         = var.vm_name
  machine_type = "e2-medium"
  zone         = var.zone

  tags = [local.http_tag, local.ssh_tag]

  boot_disk {
    # Delete the boot disk when this VM is deleted.
    auto_delete = true

    initialize_params {
      image = "debian-cloud/debian-13"
      type  = "pd-ssd"
      size  = 10

      # Do not attach a snapshot schedule to the boot disk.
      resource_policies = []
    }
  }

  network_interface {
    network = local.network_name

    # Allocate an ephemeral external IPv4 address.
    access_config {}
  }

  # No Backup and DR plan is created or associated by this configuration.
}
