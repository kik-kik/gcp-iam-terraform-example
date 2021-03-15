variable "gcp_project" {}
variable "gcp_region" {}
variable "env" {}

# Role definition
locals {
  bigquery_role     = yamldecode(file("configs/gcp/iam/roles/bigquery_role.yaml"))
  registry_role     = yamldecode(file("configs/gcp/iam/roles/registry_role.yaml"))
  role_policy       = yamldecode(file("configs/gcp/iam/roles/role_policy.yaml"))
  iam_user          = yamldecode(file("configs/gcp/iam/${var.env}/account/iam_user.yaml"))
  service_account   = yamldecode(file("configs/gcp/iam/${var.env}/account/service_account.yaml"))
  dataset_policy    = yamldecode(file("configs/gcp/iam/${var.env}/dataset_policy.yaml"))
}