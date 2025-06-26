provider "aws" {
  region = var.aws_region
}

# create vpc
resource "aws_vpc" "static_web_vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.static_web_vpc.id
  cidr_block              = var.public_subnet_cidr_block
  availability_zone       = var.public_subnet_availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = var.public_subnet_name
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.static_web_vpc.id
  cidr_block        = var.private_subnet_cidr_block
  availability_zone = var.private_subnet_availability_zone

  tags = {
    Name = var.private_subnet_name
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.static_web_vpc.id

  route = []

  tags = {
    Name = var.public_route_table_name
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.static_web_vpc.id

  route = []

  tags = {
    Name = var.private_route_table_name
  }
}

resource "aws_route_table_association" "public_route_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_route_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_internet_gateway" "static_web_igw" {
  vpc_id = aws_vpc.static_web_vpc.id

  tags = {
    Name = var.internet_gateway_name
  }
}

resource "aws_route" "public-internet-route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = aws_internet_gateway.static_web_igw.id
}



