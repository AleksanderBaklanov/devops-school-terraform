variable "aws_region" {
  type        = string
  description = "Region for AWS Resources"
  default     = "eu-central-1"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in VPC"
  default     = true
}

variable "vpc_cidr_block" {
  type        = string
  description = "Base CIDR Block for VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_public_subnet_cidr" {
  type        = string
  description = "CIDR Block for Public Subnet in VPC"
  default     = "10.0.0.0/24"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Map a public IP address for Subnet instances"
  default     = true
}

variable "instance_type" {
  type        = string
  description = "Type for EC2 Instance"
  default     = "t2.micro"
}
variable "aws_ami" {
  type        = string
  description = "AMI ID"
}
variable "environment" {
  type        = string
  description = "Environment name"
  default     = "dev"
}

variable "rds_instance_identifier" {
  type        = string
  description = "RDS identifier"
  default     = "nginx_RDS"
}

variable "database_name" {
  type        = string
  description = "name for the database which will be created on init"
  default     = "nginx_db"
}

variable "database_user" {
  type        = string
  description = "database user to be created on init"
  default     = "nginx_user"
}

variable "database_password" {
  type        = string
  description = "database user password to be created on init"
  default     = "nginx_user_PA$$W0RD"
}

variable database_engine {
  type        = string
  description = "database engine (mysql by default)"
  default     = "mysql"
}

variable database_varsion {
  type        = string
  description = "database engine version"
  default     = "8.0.27"
}
