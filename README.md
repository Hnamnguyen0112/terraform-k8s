# terraform-k8s

terraform-k8s is a codebase for managing application's infrastructure.

## Installation

Setup AWS default profile, [Example](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)

```bash
$ aws configure
AWS Access Key ID [None]: <AWS_ACCESS_KEY_ID>
AWS Secret Access Key [None]: <AWS_SECRET_ACCESS_KEY>
Default region name [None]: <REGION>
Default output format [None]: json
```

Use [Terraform](https://developer.hashicorp.com/terraform?product_intent=terraform) to initialize and configure.

In global/ foler comment out terraform code block then run commands below:

```bash
cd global/
terraform init
terraform apply
```

Remove comment after apply S3 and DynamoDB then:

```bash
terraform init
```

Now we've already synced the terraform state to S3.

## Usage

Set password for RDS database in secrets.tfvars file.

```bash
rds_production_password = "$2a$12$3EGRZNoK0KpS4rMwXdUXXeQmPqUzcmbwxJFFmFD7vksEYwucJvmwq"
rds_development_password = "$2a$12$3EGRZNoK0KpS4rMwXdUXXeQmPqUzcmbwxJFFmFD7vksEYwucJvmwq"
```

We need to initialize the terraform eks module to create the k8s cluster before apply the extension module.

In 1-modules.tf file add the code block below extension module:

```bash
destroy = true
```

Then apply the terraform code:

```bash
terraform init
terraform apply
```

After the k8s cluster is created, remove the code block above and apply the terraform code again.

```bash
terraform init
terraform apply
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## Codeowners

[@Hnamnguyen0112](https://github.com/Hnamnguyen0112)
