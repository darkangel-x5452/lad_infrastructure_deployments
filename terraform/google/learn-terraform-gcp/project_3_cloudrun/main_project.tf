terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 7.0.0"
      # Keep your existing provider version constraint here, if you have one.
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}


resource "google_project_service" "cloud_run_api" {
  for_each = local.apis
  # project            = var.project_id
  service = each.value
  # disable_on_destroy = false
}