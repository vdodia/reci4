# Dummy AWS stack for this region. Do not apply in recitation.

resource "aws_vpc" "example" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "example-vpc-us-east-1"
  }
}

resource "aws_subnet" "web" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = var.subnet_cidr
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "example-web-us-east-1"
  }
}

resource "aws_security_group" "web" {
  name   = "example-web-nsg"
  vpc_id = aws_vpc.example.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "vpc_id" {
  value = aws_vpc.example.id
}
