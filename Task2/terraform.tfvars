aws_region                  = "eu-central-1"
aws_ami                     = "ami-0eb7496c2e0403237"
instance_type               = "t2.micro"
environment                 = "dev"

vpc_cidr_block              = "10.0.0.0/16"
map_public_ip_on_launch     = false
enable_dns_hostnames        = true
rds_instance_identifier     = "terraform-mysql"
database_name               = "terraform_test_db"
database_user               = "terraform"
database_engine             = "mysql"
database_varsion            = "8.0.27"
