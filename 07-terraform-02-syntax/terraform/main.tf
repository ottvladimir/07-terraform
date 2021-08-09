    provider "aws" {
      region = "us-west-2"
    }

    data "aws_ami" "ubuntu" {
      owners = ["amazon"]
      most_recent = true
      filter {
            name   = "name"
            values = ["*ubuntu*"]
            }
    }
    resource "aws_instance" "web" {
        ami = "${data.aws_ami.ubuntu.id}"
        instance_type = "t2.micro"
	count=2
    }
