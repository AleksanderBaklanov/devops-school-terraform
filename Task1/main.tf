terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-central-1"
}

variable "aws_vpc_name" {
  type = string
}



data "aws_vpc" "wordpress-vpc" {
  filter {
    name = "tag:Name"
    values = ["wordpress-vpc"]
  }
}

data "aws_subnet_ids" "wordpress-subnets" {
  vpc_id = "${data.aws_vpc.wordpress-vpc.id}"
}

data "aws_security_groups" "wordpress-sgs" {
  filter {
    name = "group-name"
    values = ["wordpress-*"]
  }
}




output "wordpress-vpc-id" {
  value = "${data.aws_vpc.wordpress-vpc.id}"
}

output "wordpress-vpc-cidr" {
  value = "${data.aws_vpc.wordpress-vpc.cidr_block}"
}


output "wordpress-subnets" {
  value = "${data.aws_subnet_ids.wordpress-subnets.ids}"
}

output "wordpress-security-groupss" {
  value = ["${data.aws_security_groups.wordpress-sgs.ids}"]
}

