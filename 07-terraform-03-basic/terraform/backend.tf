terraform {
  backend "s3" {
    bucket = "ott_terraform-states"
    key    = "ott_terraform-states/terraform.tfstate"
    region = "us-west-2"
  }
}
