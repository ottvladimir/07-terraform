  provider "aws" {
    region = "us-west-2"
  }

  data "aws_caller_identity" "current" {}
  data "aws_region" "current" {}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"] 
  }
}
resource "aws_instance" "web" {
  ami = data.aws_ami.amazon_linux.id 
  instance_type = local.web_instance_type_map[terraform.workspace]
  count = local.web_instance_count_map[terraform.workspace]
  tags = {
    name = "simpleserver-${terraform.workspace}"
   }
}
resource "aws_instance" "tes" {
  ami = data.aws_ami.amazon_linux.id
  instance_type = local.web_instance_type_map[terraform.workspace]
  for_each = local.instances_count[terraform.workspace]
  count = each.key
  tags = {
    name = "testforeachserver-${terraform.workspace}"
   }
}
resource "aws_s3_bucket" "web_states" {
  bucket = "ovv-terraform-states"
}
