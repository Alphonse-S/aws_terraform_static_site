variable "region" {
  description = "AWS region to deploy the resources"
  type        = string
  default     = "eu-west-2"
}

variable "vpc_cidr_block" {
  description = "vpc cdir block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "aws_vpc_tags" {
  description = "Tags to apply to the VPC"
  type        = string
  default     = "static-web-vpc"
}

variable "subnet_masks" {
  description = "vpc subnet masks"
  type        = list(string)
  default     = ["10.0.1.0/24, 10.0.2.0/24"]
}


variable "availability_zones" {
  description = "vpc availability zones"
  type        = list(string)
  default     = ["eu-west-2a, eu-west-2b"]
}

variable "vpc_tenancy" {
  description = "AWS tenancy option for the vpc"
  type        = string
  default     = "default"
}
