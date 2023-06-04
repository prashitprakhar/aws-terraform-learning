# terraform Block
terraform {
    required_version = "~> 1.4.1"

    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 5.1"
       }
    }
}

# Providers Block
provider "aws" {
  region  = "ap-south-1"
  profile = "default" # Using Default Profile - whatever was configured in the aws configure
  # Static Credentials - Not Recommended
  # access_key = "AKIARQPH2G2OPIWAN2SW"
  # secret_key = "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"
}