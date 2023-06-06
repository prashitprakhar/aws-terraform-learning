# Resources Block

# Resource 1: Create VPC
resource "aws_vpc" "vpc-dev" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "vpc-dev"
  }
}

# Resource 2: Create Subnets
resource "aws_subnet" "vpc-dev-public-subnet-1" {
  vpc_id                  = aws_vpc.vpc-dev.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
}

# Resource 3: Create Internet Gateway
resource "aws_internet_gateway" "vpc-dev-igw" {
  vpc_id = aws_vpc.vpc-dev.id
}

# Resource 4: Create a Route Table
resource "aws_route_table" "vpc-dev-public-route-table" {
  vpc_id = aws_vpc.vpc-dev.id
}

# Resource 5: Create route in Route Table for Internet Access
resource "aws_route" "vpc-dev-public-route" {
  route_table_id         = aws_route_table.vpc-dev-public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc-dev-igw.id
}

# Resource 6: Associate the Route Table with the Subnet
resource "aws_route_table_association" "vpc-dev-public-route-table-associate" {
  route_table_id = aws_route_table.vpc-dev-public-route-table.id
  subnet_id      = aws_subnet.vpc-dev-public-subnet-1.id
}

# Resource 7: Create Security Group
resource "aws_security_group" "vpc-dev-sg" {
  name        = "vpc-dev-default-sg"
  description = "Dev VPC default security group"
  vpc_id      = aws_vpc.vpc-dev.id

  ingress {
    description = "Allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all IPs and Ports Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Resource 8: Create EC2 Instance
resource "aws_instance" "my-ec2-vm" {
  ami                    = "ami-0607784b46cbe5816"
  instance_type          = "t2.micro"
  key_name               = "terraform-key" # This key-pair was created in our AWS EC2 Dashboard for SSH connection
  subnet_id              = aws_subnet.vpc-dev-public-subnet-1.id
  vpc_security_group_ids = [aws_security_group.vpc-dev-sg.id]
  #user_data = file("apache-install.sh")
  user_data = <<-EOF
        #! /bin/bash
        sudo yum update -y
        sudo yum install -y httpd
        sudo service httpd start  
        sudo systemctl enable httpd
        #echo "<h1>Welcome to Home page ! AWS Infra created using Terraform in ap-south-1 Region</h1>" | sudo tee /var/www/html/index.html
        echo "<h1>Welcome to Home page ! AWS Infra created using Terraform in ap-south-1 Region</h1>" > /var/www/html/index.html
    EOF
}

# Resource 9: Create Elastic IP - depends_on IGW
resource "aws_eip" "my-eip" {
  instance = aws_instance.my-ec2-vm.id
  domain   = "vpc"

  # Meta argument
  depends_on = [
    aws_internet_gateway.vpc-dev-igw # No 'id' Here. Complete resource reference !
  ]
}