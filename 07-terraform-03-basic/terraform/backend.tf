terraform {
  backend "s3" {
    bucket = "ovv-terraform-states"
    key    = "ovv-terraform-states/terraform.tfstate"
    region = "us-west-2"
  }
}
