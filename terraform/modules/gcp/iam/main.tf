# BigQuery Roles
resource "google_project_iam_custom_role" "custom_bigquery_role" {
  count         = length(local.bigquery_role.custom_bigquery_role_list)
  project       = var.gcp_project
  role_id       = local.bigquery_role.custom_bigquery_role_list[count.index].role_id
  title         = local.bigquery_role.custom_bigquery_role_list[count.index].title
  description   = local.bigquery_role.custom_bigquery_role_list[count.index].description
  permissions   = local.bigquery_role.custom_bigquery_role_list[count.index].permissions
}

# Registry Roles
resource "google_project_iam_custom_role" "custom_registry_role" {
  count         = length(local.registry_role.custom_registry_role_list)
  project       = var.gcp_project
  role_id       = local.registry_role.custom_registry_role_list[count.index].role_id
  title         = local.registry_role.custom_registry_role_list[count.index].title
  description   = local.registry_role.custom_registry_role_list[count.index].description
  permissions   = local.registry_role.custom_registry_role_list[count.index].permissions
}

# IAM Users
resource "google_project_iam_member" "project_users" {
  count         = length(local.iam_user.iam_user_list)
  project       = var.gcp_project
  role          = "roles/viewer"
  member        = "user:${local.iam_user.iam_user_list[count.index].account_id}"
}

# IAM Admins
resource "google_project_iam_member" "project_admins" {
  count         = length(local.iam_user.iam_admin_list)
  project       = var.gcp_project
  role          = "roles/owner"
  member        = "user:${local.iam_user.iam_admin_list[count.index].account_id}"
}

# Service Accounts
resource "google_service_account" "service_account" {
  count        = length(local.service_account.service_account_list)
  account_id   = local.service_account.service_account_list[count.index].account_id
  display_name = local.service_account.service_account_list[count.index].display_name
}

# Policy member -> role
resource "google_project_iam_binding" "project" {
  count   = length(local.role_policy.role_policy_list)
  project = var.gcp_project
  role    = "projects/${var.gcp_project}/roles/${local.role_policy.role_policy_list[count.index].role_id}"
  members = local.role_policy.role_policy_list[count.index].members
}

# # Policy dataset -> role
resource "google_bigquery_dataset_iam_binding" "dataset" {
  count      = length(local.dataset_policy.dataset_policy_list)
  dataset_id = local.dataset_policy.dataset_policy_list[count.index].dataset_id
  role       = "projects/${var.gcp_project}/roles/${local.dataset_policy.dataset_policy_list[count.index].role_id}"
  members    = local.dataset_policy.dataset_policy_list[count.index].members
}