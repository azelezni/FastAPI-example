data "terraform_remote_state" "vpc" {
  backend = "s3"
  config  = {
    bucket  = "terraform-state"
    key     = "projects/vpc"
    region  = "eu-west-1"
  }
}
