data "aws_vpc" "selected" {
 filter {
   name   = "tag:Name"
   values = ["default-vpc"] # to be replaced with your VPC name
 }
}

data "aws_vpc" "selected_default" {
  default = true
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  filter {
    name   = "name"
    values = ["al2023-ami-2023*-kernel-6.1-x86_64"] #Amazon Linux 2 AMI, you can change to other AMI if you want
  }
    owners = ["amazon"]
}

data "aws_subnets" "example" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}