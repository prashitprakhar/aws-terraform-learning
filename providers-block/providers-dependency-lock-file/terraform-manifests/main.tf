# Terraform Settings Block
terraform {
    required_version = "~> 1.4.0"
    required_providers {
      #AWS Provider
      aws = {
          source  = "hashicorp/aws"
          version = ">= 4.0"
      }

      # Random Provivder
      random = {
          source  = "hashicorp/random"
          version = "~> 3.5.0"
      }
    }
}

# Provider Block
provider "aws" {
    region  = "ap-south-1"
    profile = "default"
}