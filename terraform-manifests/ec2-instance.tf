# Terraform Settings Block
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
        }
    }
}

# Provider Block
provider "aws" {
    profile = "default"
    region  = "ap-south-1"
}

# Resource Block
resource "aws_instance" "ec2demo" {
    ami            = "ami-0607784b46cbe5816"
    instance_type  = "t2.micro"
}