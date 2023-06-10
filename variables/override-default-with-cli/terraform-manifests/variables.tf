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
  default     = 2
}

# Assign when prompted using CLI
variable "ec2_instance_type" {
  description = "EC2 Instance type"
  type        = string
  default     = "t2.small"
}

# CLI Command
# terraform plan -var="ec2_instance_type=t2.micro" -var="ec2_instance_count=1"
# terraform apply -var="ec2_instance_type=t2.micro" -var="ec2_instance_count=1"

# OR

# terraform plan -var="ec2_instance_type=t2.micro" -var="ec2_instance_count=1" -out tplan.plan
# terraform apply tplan.plan (No need of "-auto-approve" here)