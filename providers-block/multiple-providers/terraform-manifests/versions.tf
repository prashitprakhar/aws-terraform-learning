terraform {
    required_version = "~> 1.4.6"

    required_providers {
      aws = {
          source = "hashicorp/aws"
          version = "~> 5.1"
      }
    }
}

# Provider block 1
provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}

# Provider block 1
provider "aws" {
  region  = "us-east-1"
  profile = "default"
  alias = "aws-us-east-1"
}