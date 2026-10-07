
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

variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
  default     = "project-2-vm"
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
