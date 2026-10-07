
variable "environment" {
  type        = string
  description = "Deployment environment name"
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "region" {
  type        = string
  description = "Deployment region"
  default     = "australia-southeast1"

  validation {
    condition     = contains(["australia-southeast1", "staging", "prod"], var.region)
    error_message = "Region must be australia-southeast1."
  }
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
  sensitive   = true
}

variable "cloud_run_name" {
  type        = string
  description = "Name of the Cloud Run service"
  default     = "project-3-cloudrun"
  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{1,18}[a-z0-9]$", var.cloud_run_name))
    error_message = "Use 3-20 lowercase letters/digits/hyphens, starting with a letter and ending alphanumeric."
  }
}

variable "zone" {
  type        = string
  description = "Availability zone for the virtual machine"
  default     = "australia-southeast1-a"
}

variable "terraform_network_name" {
  type        = string
  description = "Name of the Terraform network"
  default     = "terraform-network"
}

variable "image" {
  description = "Immutable image reference taken from repository hosting docker images."
  type        = string
  default     = "us-docker.pkg.dev/cloudrun/container/hello"
  # validation {
  #   condition     = can(regex("^[a-z0-9-]+-docker\\.pkg\\.dev/[^ @]+/[^ @]+/app@sha256:[0-9a-f]{64}$", var.image))
  #   error_message = "Use the complete Artifact Registry app@sha256:... reference, not a tag."
  # }
}

variable "min_instances" {
  type    = number
  default = 0
  validation {
    condition     = var.min_instances >= 0 && floor(var.min_instances) == var.min_instances
    error_message = "Minimum instances must be a non-negative integer."
  }
}

variable "max_instances" {
  type    = number
  default = 1
  validation {
    condition     = var.max_instances >= 1 && floor(var.max_instances) == var.max_instances
    error_message = "Maximum instances must be a positive integer."
  }
}

variable "concurrency" {
  type    = number
  default = 1
  validation {
    condition     = var.concurrency >= 1 && var.concurrency <= 1000 && floor(var.concurrency) == var.concurrency
    error_message = "Concurrency must be an integer between 1 and 1000."
  }
}

variable "requests_per_minute_per_ip" {
  description = "Example edge throttle; tune for your app and clients behind shared IPs. Not an exact quota."
  type        = number
  default     = 60
  validation {
    condition     = var.requests_per_minute_per_ip >= 1 && floor(var.requests_per_minute_per_ip) == var.requests_per_minute_per_ip
    error_message = "Rate threshold must be a positive integer."
  }
}

variable "deletion_protection" {
  type    = bool
  default = true
}

# variable "db_username" {
#   description = "Database administrator username"
#   type        = string
#   sensitive   = true
# }

# variable "db_password" {
#   description = "Database administrator password"
#   type        = string
#   sensitive   = true
# }
