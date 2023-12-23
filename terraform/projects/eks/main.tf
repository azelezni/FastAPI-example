## Backend ##
terraform {
  required_version = ">= 1.3.9"

  backend "s3" {
    bucket         = "terraform-state"
    key            = "projects/eks"
    region         = "eu-west-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}

## AWS ##
provider "aws" {
  region = "eu-west-1"

  default_tags {
    tags = {
      ENV = var.name
    }
  }
}
