# LAD Infrastructure Deployments

This repository contains infrastructure-as-code examples and experiments for provisioning cloud resources across multiple providers. The current focus is on Terraform-based deployments, with the most complete examples targeting Google Cloud Platform (GCP).

The goal of the project is to practice real-world infrastructure patterns such as project setup, networking, VM deployment, Cloud Run hosting, and secret management in a repeatable, code-driven way.

## Repository structure

- `terraform/aws/` - AWS deployment templates and future infrastructure experiments
- `terraform/azure/` - Azure deployment templates and future infrastructure experiments
- `terraform/google/` - Google Cloud examples and Terraform projects
  - `learn-terraform-gcp/project_1_basic/` - basic GCP project setup and Terraform fundamentals
  - `learn-terraform-gcp/project_2_vm_website/` - network and VM setup for hosting a simple website
  - `learn-terraform-gcp/project_3_cloudrun/` - containerized service deployment to Cloud Run
  - `learn-terraform-gcp/secrets/` - example secret/configuration files and credential references

## Current examples

### 1. Basic GCP project

The base project establishes a Terraform workflow for GCP, including service configuration and project resources.

### 2. VM website deployment

This example creates the networking and compute resources needed to run a simple website on a VM. The README in that folder includes steps to install Apache and serve a basic HTML page.

### 3. Cloud Run deployment

This example demonstrates deploying a containerized application to Cloud Run and includes guidance for troubleshooting GCP API enablement and permissions.

## Prerequisites

Before running these examples, ensure you have:

- Terraform installed
- Google Cloud SDK (`gcloud`) installed and configured
- A GCP project with billing enabled
- Appropriate IAM permissions to manage the required resources
- A local `secret.auto.tfvars` or `secret.tfvars` file for sensitive values

## Google Cloud setup

Install Terraform and the Google Cloud SDK if needed:

- Terraform install guide: https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/install-cli
- Google Cloud SDK install guide: https://cloud.google.com/sdk/docs/install

Authenticate with GCP:

```bash
gcloud auth login
gcloud auth application-default login
```

If using workload identity federation or a service account, set the credential path before running Terraform:

```bash
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/credential-configuration.json"
```

## Typical Terraform workflow

From a specific project folder, run:

```bash
terraform init -var-file="secret.tfvars"
terraform fmt
terraform validate -var-file="secret.tfvars"
terraform plan -var-file="secret.tfvars"
terraform apply -var-file="secret.tfvars"
```

To inspect the current state:

```bash
terraform show
```

To remove deployed resources:

```bash
terraform destroy -var-file="secret.tfvars"
```

## Secret management

Sensitive values should not be committed directly to source control. The project includes examples that use local Terraform variable files such as:

- `secret.auto.tfvars`
- `secret.tfvars`

Common pattern:

```bash
export TF_CLI_ARGS_plan='-var-file="secret.tfvars"'
export TF_CLI_ARGS_apply='-var-file="secret.tfvars"'
```

## Notes

- This repository is intended as a learning and experimentation space, not a production-hardened platform.
- State files and credential files may appear in local directories during deployment. Treat them as sensitive material.
- Some examples are intentionally kept lightweight and may require additional setup such as installing software on a VM or enabling GCP APIs.

## Useful references

- HashiCorp Terraform documentation: https://developer.hashicorp.com/terraform
- Google provider documentation: https://registry.terraform.io/providers/hashicorp/google/latest/docs
- Terraform on GCP tutorial: https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build

## License

This project is provided for educational and infrastructure-learning purposes. Update this section if you need to add a specific license for your environment.
