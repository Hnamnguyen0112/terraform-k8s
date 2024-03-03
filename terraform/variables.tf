variable "aws_s3_bucket" {
  type        = string
  description = "The name of the S3 bucket that will be used for the Terraform state."
  default     = "terraform-state"
}

variable "aws_region" {
  type        = string
  description = "The AWS region that will be used for the resources."
  default     = "ap-southeast-1"
}

variable "aws_dynamic_table" {
  type        = string
  description = "The name of the DynamoDB table that will be used for the Terraform state."
  default     = "terraform-state"
}

variable project {
  type        = string
  description = "Globally used project name for this demo."
  validation {
    # check the length of the string and ensure it does not contain spaces
    # see https://www.terraform.io/docs/language/values/variables.html#custom-validation-rules
    condition = (
      length(var.project) > 4 &&
      length(var.project) < 32 &&
      replace(var.project, " ", "") == var.project
    )

    error_message = "The project_name must be between 4 and 32 characters and may not contain spaces."
  }
}

variable region {
  type        = string
  description = "AWS US-based Region that will be used in this demo."
  default = "ap-southeast-1"
}

variable cidr_block {
  type        = string
  description = "The CIDR block that will be used for the VPC."
  default     = "10.0.0.0/16"
}

variable cluster_version {
  type        = string
  description = "The Kubernetes version for our clusters"
  default     = "1.27"
}

variable cluster_enabled_log_types {
  type        = list(string)
  description = "The Kubernetes log types that will be enabled for the EKS cluster."
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

variable infra_repo {
  type        = string
  description = "The name of the repository that will be used for the infrastructure code."
}

variable rds_development_password {
  type        = string
  description = "The password for the development RDS instance."
}

variable rds_development_db_name {
  type        = string
  description = "The name of the development database."
}

variable rds_development_username {
  type        = string
  description = "The username for the development database."
}

variable rds_development_port {
  type        = number
  description = "The port for the development database."
  default     = 5432
}

variable rds_production_password {
  type        = string
  description = "The password for the production RDS instance."
}

variable rds_production_db_name {
  type        = string
  description = "The name of the production database."
}

variable rds_production_username {
  type        = string
  description = "The username for the production database."
}

variable rds_production_port {
  type        = number
  description = "The port for the production database."
  default     = 5432
}
