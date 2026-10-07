# Setup
terraform:
- https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/install-cli
google cli:
- https://docs.cloud.google.com/sdk/docs/install-sdk#deb

terraform google cloud build:
- https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build
- Authentication
    - gcloud auth list
    - Instead of using google login, use workload identity federation for better cicd integration.

- For secrets variabels without needing to spec in commands:
    - Use a "secret.auto.tfvars"
    - "secret.tfvars"
        export TF_CLI_ARGS_plan='-var-file="secret.tfvars"'
        export TF_CLI_ARGS_apply='-var-file="secret.tfvars"'

# Run
- terraform init -var-file="secret.tfvars"
- terraform fmt
- terraform validate -var-file="secret.tfvars"
- terraform apply -var-file="secret.tfvars"
- terraform show

# Resources:
- Terraform GCP resource arguements
    - https://registry.terraform.io/providers/hashicorp/google/latest/docs


# Environment Variables
If using Federation or Service Account auth.
- export GOOGLE_APPLICATION_CREDENTIALS="/path/to/credential-configuration.json"