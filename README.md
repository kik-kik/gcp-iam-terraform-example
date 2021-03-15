# Experimental project to use Terraform for managing access in GCP

## Usage
This guide assumes you have terraform 0.14 installed on your machine. If not, please follow [the official guide](https://learn.hashicorp.com/tutorials/terraform/install-cli to install Terraform). For running multiple versions of Terraform you can use something like [tfenv](https://github.com/tfutils/tfenv).

1. Inside `dev.tfvar` add information related to your GCP project (project_id, region, )
2. Make sure you have configured your GCP credentials by setting `GOOGLE_APPLICATION_CREDENTIALS` environment variable to point to your credentials file.
3. Navigate to `terraform/` and run `terraform init`
4. Run `terraform plan -var-file="dev.tfvar" -out=/tmp/dev.tfplan`
5. If you're happy with the plan and want to apply the changes run `terraform apply 

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
    ├── dev.tfvar
    ├── main.tf
    ├── modules
    │   └── gcp
    │       └── iam
    │           ├── main.tf
    │           └── variables.tf
    ├── prod.tfvar
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

- gcp/iam/dev/ - contains dev environment specific configuration 
- gcp/iam/roles/ - folder containing role definitions (shared across environments)
- dev.tfvar - input variables that for dev environment that can be passed to plan/apply using `-var-file` argument.


### modules/


### providers/
Contains provider definition and configuration.

## Special thanks
Special thanks to [mehd-io](https://github.com/mehd-io) and [ash-ber](https://github.com/ash-ber) for inspiring me to do this project.

## Further reading
- Google Provider - https://registry.terraform.io/providers/hashicorp/google/latest/docs
- Understanding GCP roles - https://cloud.google.com/iam/docs/understanding-roles
- HashiCorp Learn (an awesome resource) - https://learn.hashicorp.com/collections/terraform/modules
