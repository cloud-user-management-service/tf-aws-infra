# tf-aws-infra
Instructions for setting up the infrastructure using Terraform

## To get started building infrastructure resources using Terraform, there are few things that you should take care of. The general steps to deploy a resource(s) in the cloud are:
1. Set up a Cloud Account on any cloud provider (AWS, Azure, OCI)
2. [Install Terraform](https://developer.hashicorp.com/terraform/install)
3. Configure proper access permissions
4. Add a provider – AWS, Azure, OCI, GCP, or others
5. Write configuration files
6. Initialize Terraform Providers
   ```terraform init```
7. PLAN (DRY RUN) using terraform plan
   ```terraform plan```
8. APPLY (Create a Resource) using terraform apply
   ```terraform apply```
9. DESTROY (Delete a Resource) using terraform destroy
    ```terraform destroy```