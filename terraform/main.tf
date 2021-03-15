terraform {
  required_version = ">= 0.14"
  backend "gcs" {
    bucket = "terraform_gcp_iam"
  }
}

module "iam" {
  source      = "./modules/gcp/iam"
  gcp_region  = var.gcp_region
  gcp_project = var.gcp_project
  env         = var.env
}
