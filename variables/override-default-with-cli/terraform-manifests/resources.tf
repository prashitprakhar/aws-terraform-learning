# Resource: EC2
resource "aws_instance" "ec2demo" {
  ami           = var.ec2_ami_id
  instance_type = var.ec2_instance_type
  key_name      = "terraform-key"
  count         = var.ec2_instance_count
  user_data     = <<-EOF
        #! /bin/bash
        sudo yum update -y
        sudo yum install -y httpd
        sudo service httpd start  
        sudo systemctl enable httpd
        #echo "<h1>Welcome to Home page ! AWS Infra created using Terraform in ap-south-1 Region</h1>" | sudo tee /var/www/html/index.html
        echo "<h1>Welcome to Home page ! AWS Infra created using Terraform in ap-south-1 Region</h1>" > /var/www/html/index.html
    EOF

  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "name" = "myec2vm"
  }
}
