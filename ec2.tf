resource "aws_instance" "web" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.ec2_key_name
  subnet_id       = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.static_web_ec2.id]


  user_data = file("${path.module}/user_data.sh")


  tags = {
    Name = "var.ec2_instance_name"
  }
}

#create key_pair
resource "aws_key_pair" "deployer" {
  key_name   = var.ec2_key_name
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
}

resource "aws_security_group" "static_web_ec2" {
  name        = var.security_group_name
  description = "Security group for static web hosting"
  vpc_id      = aws_vpc.static_web_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "http"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "ssh"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.security_group_name
  }

}