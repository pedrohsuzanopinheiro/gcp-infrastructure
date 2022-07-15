
# GCP Terraform Infrastructure

Simple infrastructure for execute Data Engineering on GCP.

## Create a terraform.tfvars in root directory like this:
```bash
project                  = "<PROJECT_ID>"
credentials_file         = "<FILE>"
```

To create the infrastructure, type `terraform apply`