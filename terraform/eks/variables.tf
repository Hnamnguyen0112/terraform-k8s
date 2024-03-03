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
}

variable cidr_block {
  type        = string
  description = "The CIDR block that will be used for the VPC."
}

variable cluster_version {
  type        = string
  description = "The Kubernetes version for our clusters"
}

variable cluster_enabled_log_types {
  type        = list(string)
  description = "The Kubernetes log types that will be enabled for the EKS cluster."
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
}
