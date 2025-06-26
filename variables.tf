variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_tenancy" {
  description = "Instance tenancy for the VPC"
  type        = string
  default     = "default"
}

variable "enable_dns_support" {
  description = "Enable DNS support for the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames for the VPC"
  type        = bool
  default     = true
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
  default     = "main"
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_availability_zone" {
  description = "Availability zone for the public subnet"
  type        = string
  default     = "eu-west-2a"
}

variable "map_public_ip_on_launch" {
  description = "Map public IP on launch for the public subnet"
  type        = bool
  default     = true
}

variable "public_subnet_name" {
  description = "Name tag for the public subnet"
  type        = string
  default     = "Main"
}

variable "private_subnet_cidr_block" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_availability_zone" {
  description = "Availability zone for the private subnet"
  type        = string
  default     = "eu-west-2b"
}

variable "private_subnet_name" {
  description = "Name tag for the private subnet"
  type        = string
  default     = "Main"
}

variable "public_route_table_name" {
  description = "Name tag for the public route table"
  type        = string
  default     = "Main"
}

variable "private_route_table_name" {
  description = "Name tag for the private route table"
  type        = string
  default     = "Main"
}

variable "internet_gateway_name" {
  description = "Name tag for the internet gateway"
  type        = string
  default     = "prod-igw"
}

variable "destination_cidr_block" {
  description = "Destination CIDR block for the public route"
  type        = string
  default     = "0.0.0.0/0"
}
