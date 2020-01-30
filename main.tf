# S3 bucket config

provider "tfe" {
  hostname = var.tfe_hostname
  token    = var.tfe_token
}

provider "aws" {
  region = var.region
}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "akentosh"

    workspaces {
      name = "remote-apply"
    }
  }
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "hugs-are-great"
  acl    = "public"

  versioning = {
    enabled = true
  }

}
