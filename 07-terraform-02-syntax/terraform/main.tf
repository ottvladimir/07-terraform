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
          count = 2
          ipv6_address_count = 1
          cpu_core_count = 1
          disable_api_termination = false
	  ebs_block_device {
            device_name = "/dev/xvdb"
            volume_type = "gp2"
            volume_size = 10
          }
        tags = {
          "Name" = "HelloWorld"
          }
          user_data = <<EOF
#!/bin/bash
echo "Hello, world!"
EOF
      }

