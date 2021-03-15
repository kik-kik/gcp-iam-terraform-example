[![.github/workflows/validate_terraform_dev.yaml](https://github.com/kik-kik/gcp-iam-terraform-example/actions/workflows/validate_terraform_dev.yaml/badge.svg)](https://github.com/kik-kik/gcp-iam-terraform-example/actions/workflows/validate_terraform_dev.yaml)

# Experimental project to use Terraform for managing access in GCP

## Usage
This guide assumes you have terraform 0.14 installed on your machine. If not, please follow [the official guide](https://learn.hashicorp.com/tutorials/terraform/install-cli to install Terraform). For running multiple versions of Terraform you can use something like [tfenv](https://github.com/tfutils/tfenv).

1. Make sure you have configured your GCP credentials by setting `GOOGLE_APPLICATION_CREDENTIALS` environment variable to point to your credentials file.
2. Navigate to `terraform/` and run `terraform init`
3. Run `terraform plan -var 'gcp_project=my-gcp-project' -var 'gcp_region=gcp-region' -var 'env=dev' -out=/tmp/dev.tfplan`. Alternatively, you can create `dev.tfvars` file inside `terraform/` and use the following command instead `terraform plan -var-file="dev.tfvars" -out=/tmp/dev.tfplan`.
4. If you're happy with the plan and want to apply the changes run `terraform apply /tmp/dev.tfplan`

### Disclaimer
This project was only intended as a personal project that was put together in short amount of time and therefore is far from being a production ready setup, so please treat it as such.

## Project structure
``` bash
.
├── README.md
└── terraform
    ├── configs
    │   └── gcp
    │       └── iam
    │           ├── dev
    │           │   ├── account
    │           │   │   ├── iam_user.yaml
    │           │   │   └── service_account.yaml
    │           │   └── dataset_policy.yaml
    │           └── roles
    │               ├── bigquery_role.yaml
    │               ├── registry_role.yaml
    │               └── role_policy.yaml
    ├── main.tf
    ├── modules
    │   └── gcp
    │       └── iam
    │           ├── main.tf
    │           └── variables.tf
    ├── providers
    │   └── provider.tf
    └── variables.tf
```
## terraform/
Contains all of the terraform configuration.

### main.tf
Entry point to the terraform code. Specifies the backend and iam module which contains all of the "logic".

### variables.tf
A list of required input arguments for this terraform codebase.

### configs/
High level folder containing yaml based configuration for easier usage.

- `gcp/iam/dev/` - contains dev environment specific configuration
- `gcp/iam/roles/` - folder containing role definitions (shared across environments)

### modules/


### providers/
Contains provider definition and configuration.

## Special thanks
Special thanks to [mehd-io](https://github.com/mehd-io) and [ash-ber](https://github.com/ash-ber) for inspiring me to do this project.

## Further reading
- Google Provider - https://registry.terraform.io/providers/hashicorp/google/latest/docs
- Understanding GCP roles - https://cloud.google.com/iam/docs/understanding-roles
- HashiCorp Learn (an awesome resource) - https://learn.hashicorp.com/collections/terraform/modules
