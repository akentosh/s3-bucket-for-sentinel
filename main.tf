# S3 bucket config

provider "tfe" {
  hostname = var.tfe_hostname
  token    = var.tfe_token
  version  = ">= 0.4"
}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "akentosh"

    workspaces {
      name = "s3-bucket"
    }
  }
}

variable "tfe_token" {
}

variable "tfe_hostname" {
  description = "The domain where your TFE is hosted."
  default     = "app.terraform.io"
}

variable "tfe_organization" {
  description = "The TFE organization to apply your changes to."
  default     = "akentosh"
}

resource "aws_s3_bucket" "cool" {
  bucket = "akentosh-super-cool-bucket"
  acl    = "public"
  
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }
  tags = {
    Customer = "Goodyear"
    Owner   = "akentosh"
  }
}
