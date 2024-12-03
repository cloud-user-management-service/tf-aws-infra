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

## Importing SSL Certificate into AWS Certificate Manager (ACM)

1. Create SSL certificate from Namecheap.
2. Create the `ssl.inf` file with the following content:
```
[NewRequest]
Subject = "CN=demo.llling.me, C=US, ST=Washington, L=Seattle, O=Ling, OU=IT Department"
Exportable = TRUE
KeyLength = 2048
KeySpec = 1
KeyUsage = 0xf0
MachineKeySet = TRUE
[RequestAttributes]
```
3. Run the powershell command to generate the CSR:
```
certreq -new ssl.inf csr.txt
```
4. Use the csr.txt to activate the SSL certificate on Namecheap.
5. Download the SSL certificate from Namecheap. Unzip the downloaded file, and the folder should look like:
```
domain
|__domain.ca-bundle
|__domain.crt
|__domain.p7b
```
6. Export the private key using "Manage computer certificates" on Windows. Under "Certificate Enrollment Requests", find the domain file, and export the private key into the `ssl.key.pfx` file.
7. Extract the private key from the `ssl.key.pfx` file by running:
```
openssl pkcs12 -in ssl.key.pfx -nocerts -nodes -out demo_llling_me.key
```
8. Place the certificate (`.crt` file), private key (`.key` file), and certificate bundle file (`.ca-bundle` file) in a secure directory.
9. Use the following command to import the certificate into ACM:

```
aws acm import-certificate \
   --certificate fileb://path_to_certificate/demo_llling_me.crt \
   --private-key fileb://path_to_private_key/demo_llling_me.key \
   --certificate-chain fileb://path_to_certificate_chain/demo_llling_me.ca-bundle \
   --region us-west-2 \
   --profile demo
```