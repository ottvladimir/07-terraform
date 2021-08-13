locals {
  web_instance_type_map = {
    stage = "t2.micro"
    prod = "t3.large"
  }
  web_instance_count_map = {
    stage = 1
    prod = 2
  }
}
locals {
  instances_count = {
    stage = {2}
    prod = {3}
  }
}
