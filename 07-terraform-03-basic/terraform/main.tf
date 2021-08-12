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
  instance_type = "t2.micro"
  tags = {
    name = "simpleserver"
   }
}
resource "aws_s3_bucket" "web_states" {
  bucket = "ovv-terraform-states"
}
