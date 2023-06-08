# EC2 Resource config

resource "aws_instance" "my-ec2-instance" {
  ami               = "ami-0607784b46cbe5816"
  instance_type     = "t2.micro"
#   availability_zone = "ap-south-1a"
  availability_zone = "ap-south-1b"
  tags = {
    "Name" = "web"
  }

  # Meta Arguments: lifecycle
  lifecycle {
    create_before_destroy = true
  }
}