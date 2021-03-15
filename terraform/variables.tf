variable "gcp_project" {
    description = "Name of GCP project where resources should be managed by Terraform"
    type = string
}

variable "gcp_region" {
    description = "Project region"
    type = string
}

variable "env" {
    description = "Project environment"
    type = string
}
