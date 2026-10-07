
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
  description = "Database administrator username"
  type        = string
  sensitive   = true
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
