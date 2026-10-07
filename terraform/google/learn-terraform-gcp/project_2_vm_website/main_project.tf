terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      # Keep your existing provider version constraint here, if you have one.
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}
