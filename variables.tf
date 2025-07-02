## Define provider variables
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}

## Define VPC variables
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

## Define ec2 variables
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-038f9d29d28d79637"
}


variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "ec2_instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "web-server"
}

variable "ec2_key_name" {
  description = "Key name for the EC2 instance"
  type        = string
  default     = "deployer" 
}

variable "security_group_name" {
  description = "Name tag for the security group"
  type        = string
  default     = "static_web_ec2" 
}

## Define variables for s3 bucket
variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "my-static-site-swagger-1995" 
}

variable "s3_bucket_tags" {
  description = "Tags for the S3 bucket"
  type        = map(string)
  default     = {
    Name = "StaticWebsiteBucket" 
  }
}

variable "block_public_acls" {
  description = "Block public ACLs for the S3 bucket"
  type        = bool
  default     = false
}

variable "block_public_policy" {
  description = "Block public policy for the S3 bucket"
  type        = bool
  default     = false
}

variable "ignore_public_acls" {
  description = "Ignore public ACLs for the S3 bucket"
  type        = bool
  default     = false
}

variable "restrict_public_buckets" {
  description = "Restrict public buckets for the S3 bucket"
  type        = bool
  default     = false
}

## Define an Object Variable for the s3 bucket website configuration
variable "s3_bucket_website_configuration" {
  description = "Website configuration for the S3 bucket"
  type = object({
    index_document_suffix = string
    error_document_key    = string
    routing_rule          = object({
      condition = object({
        key_prefix_equals = string
      })
      redirect = object({
        replace_key_prefix_with = string
      })
    })
  })
  default = {
    index_document_suffix = "index.html"
    error_document_key    = "error.html"
    routing_rule = {
      condition = {
        key_prefix_equals = "docs/"
      }
      redirect = {
        replace_key_prefix_with = "documents/"
      }
    }
  }
}


## Define Route53 variables
variable "route53_zone_name" {
  description = "Name of the Route53 zone"
  type        = string
  default     = "swagg.click"
}

variable "route53_record_name" {
  description = "Name of the Route53 record"
  type        = string
  default     = "www"
}

variable "route53_record_type" {
  description = "Type of the Route 53 record"
  type        = string
  default     = "A" 
}

variable "route53_record_set_identifier" {
  description = "Set identifier for the Route 53 record"
  type        = string
  default     = "primary" 
}

## Define cloudfront variables
variable "cloudfront_origin_domain_name" {
  description = "Domain name of the origin for the CloudFront distribution"
  type        = string
  default     = "my-static-site-swagger-1995.s3.eu-west-2.amazonaws.com" 
}

variable "cloudfront_origin_id" {
  description = "Origin ID for the CloudFront distribution"
  type        = string
  default     = "s3-origin-static-website"
}


variable "cloudfront_allowed_methods" {
  description = "Allowed methods for the default cache behavior"
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "cloudfront_cached_methods" {
  description = "Cached methods for the default cache behavior"
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "cloudfront_target_origin_id" {
  description = "Target origin ID for the default cache behavior"
  type        = string
  default     = "s3-origin-static-website"
}

variable "cloudfront_viewer_protocol_policy" {
  description = "Viewer protocol policy for the default cache behavior"
  type        = string
  default     = "allow-all"
}

variable "cloudfront_min_ttl" {
  description = "Minimum TTL for the default cache behavior"
  type        = number
  default     = 0
}

variable "cloudfront_default_ttl" {
  description = "Default TTL for the default cache behavior"
  type        = number
  default     = 3600
}

variable "cloudfront_max_ttl" {
  description = "Maximum TTL for the default cache behavior"
  type        = number
  default     = 86400
}