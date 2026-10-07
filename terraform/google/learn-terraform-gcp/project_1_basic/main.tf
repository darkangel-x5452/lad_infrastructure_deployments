terraform {
  required_providers {
    google = {
      #   source = "hashicorp/google"
      source  = "registry.terraform.io/hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = "${var.region}-a"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "e2-medium"
  tags         = ["web", "dev"]

  boot_disk {
    initialize_params {
        # https://docs.cloud.google.com/compute/docs/images#console
    #   image = "ubuntu-os-cloud/ubuntu-2604-lts-amd64"
      image = "debian-13-trixie-v20260921"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}
