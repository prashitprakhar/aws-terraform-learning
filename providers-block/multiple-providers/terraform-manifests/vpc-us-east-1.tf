# Resource Block
resource "aws_vpc" "vpc-us-east-1" {
  cidr_block = "10.0.0.0/16"
  provider = aws.aws-us-east-1 #Referencing from providers list. This is a meta argument
  tags = {
    "Name" = "vpc-us-east-1"
  }
}