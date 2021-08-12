  provider "aws" {
    region = "us-west-2"
  }

  data "aws_caller_identity" "current" {}
  data "aws_region" "current" {}
  data "aws_instance" "current" {
    filter {
      name = "tag:Name"
      values = ["simpleserver"]
      }
    depends_on = [
	aws_instance.web
	]
	
    }
  resource "aws_instance" "web" {
      count = 1
      ami = "ami-03d5c68bab01f3496"
      instance_type = "t2.micro"
      disable_api_termination = false
      ebs_block_device {
                  device_name = "/dev/xvdb"
                  volume_type = "gp2"
                  volume_size = 10
                    }
      user_data = <<EOF
#!/bin/bash
echo "Hello, world!"
EOF
  tags = {
           Name = "simpleserver"
   }	 
 }
resource "aws_s3_bucket" "web" {
 bucket = "1-test32-test"
}
