# Resource Block
resource "aws_vpc" "vpc-mumbai" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "vpc-mumbai"
  }
}