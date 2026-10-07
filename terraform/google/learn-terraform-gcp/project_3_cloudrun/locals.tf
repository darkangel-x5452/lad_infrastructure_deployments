locals {
  apis = toset([
    # "artifactregistry.googleapis.com",
    "run.googleapis.com",
    # "compute.googleapis.com",
    "iam.googleapis.com",
    # "secretmanager.googleapis.com",
    # "certificatemanager.googleapis.com",
    # "dns.googleapis.com",
  ])
}