# S3 bucket config

provider "tfe" {
  hostname = var.tfe_hostname
#  token    = var.tfe_token
}

provider "aws" {
  region = var.region
}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "akentosh"

    workspaces {
      name = "s3-bucket-for-sentinel"
    }
  }
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "hugs-are-great"
#  acl    = "private"
  versioning = {
    enabled = true
  }
  tags = {
    Owner   = "akentosh"
  }
}
