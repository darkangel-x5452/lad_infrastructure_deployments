output "vm_name" {
  description = "Name of the created VM."
  value       = google_compute_instance.server.name
}

output "vm_external_ip" {
  description = "Ephemeral external IPv4 address of the VM."
  value       = google_compute_instance.server.network_interface[0].access_config[0].nat_ip
}