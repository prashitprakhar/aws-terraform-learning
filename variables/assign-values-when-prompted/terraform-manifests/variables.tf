# Input Variables

variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "ap-south-1"
}

variable "ec2_ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-0607784b46cbe5816"
}

variable "ec2_instance_count" {
  description = "EC2 instance Count"
  type        = number
  default     = 1
}

# Assign when prompted using CLI
variable "ec2_instance_type" {
  description = "EC2 Instance type"
  type        = string
}
