# EC2 Resource config

resource "aws_instance" "my-ec2-vm" {
  ami               = "ami-0607784b46cbe5816"
  instance_type     = "t2.micro"
  availability_zone = "ap-south-1a"
  tags = {
    "Name" = "web"
    "tag1" = "Test tag"
  }
}