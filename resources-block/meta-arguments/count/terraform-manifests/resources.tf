# EC2 Resource config
resource "aws_instance" "my-ec2-vm" {
  ami           = "ami-0607784b46cbe5816"
  instance_type = "t2.micro"
  count = 5
  tags = {
    "Name" = "web-${count.index}"
    # "Name" = "web"
  }
}
