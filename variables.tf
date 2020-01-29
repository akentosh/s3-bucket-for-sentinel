variable "tfe_token" {
}

variable "tfe_hostname" {
  description = "The domain where your TFE is hosted."
  default     = "app.terraform.io"
}

variable "region" {
  description = "aws region"
  default     = "us-east-1"
}
