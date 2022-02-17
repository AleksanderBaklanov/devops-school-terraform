data "aws_availability_zones" "available" {}

resource "aws_vpc" "nginx_test_vpc" {
  cidr_block        = var.vpc_cidr_block

  tags = merge (
    local.common_tags,
    {
        Name = "nginx_test_vpc"
    }
  )
}

resource "aws_subnet" "nginx_public_subnet" {
  count                   = "${length(data.aws_availability_zones.available.names)}"
  vpc_id                  = aws_vpc.nginx_test_vpc.id
  cidr_block              = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${element(data.aws_availability_zones.available.names, count.index)}"
  tags = merge (
    local.common_tags,
    {
        Name = "nginx_public_subnet-${element(data.aws_availability_zones.available.names, count.index)}"
    }
  )
}

resource "aws_subnet" "nginx_private_subnet" {
  count                   = "${length(data.aws_availability_zones.available.names)}"
  vpc_id                  = aws_vpc.nginx_test_vpc.id
  cidr_block              = "10.0.${count.index + length(data.aws_availability_zones.available.names)}.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "${element(data.aws_availability_zones.available.names, count.index)}"
  tags = merge (
    local.common_tags,
    {
        Name = "nginx_private_subnet-${element(data.aws_availability_zones.available.names, count.index)}"
    }
  )
}


resource "aws_internet_gateway" "nginx_igw" {
  vpc_id            = aws_vpc.nginx_test_vpc.id

  tags = merge (
    local.common_tags,
    {
        Name = "nginx_internet_gateway"
    }
  )
}

resource "aws_route_table" "nginx_public_rt" {
  vpc_id            = aws_vpc.nginx_test_vpc.id

  route {
    cidr_block      = "0.0.0.0/0"
    gateway_id      = aws_internet_gateway.nginx_igw.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.nginx_igw.id
  }

  tags = merge (
    local.common_tags,
    {
        Name = "nginx_public_rt"
    }
  )
}

resource "aws_route_table_association" "nginx_public_1_rt_a" {
  subnet_id         = aws_subnet.nginx_public_subnet[0].id
  route_table_id    = aws_route_table.nginx_public_rt.id
}

resource "aws_security_group" "nginx_sg" {
  name              = "HTTP and SSH"
  vpc_id            = aws_vpc.nginx_test_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge (
    local.common_tags,
    {
        Name = "nginx_security_group"
    }
  )
}

resource "aws_security_group" "mysql_sg" {
  name              = "mysql_security_group"
  vpc_id            = aws_vpc.nginx_test_vpc.id

  ingress {
    from_port         = 3306
    to_port           = 3306
    protocol          = "tcp"
    security_groups   = ["${aws_security_group.nginx_sg.id}"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge (
    local.common_tags,
    {
        Name = "mysql_security_group"
    }
  )
}

resource "aws_db_subnet_group" "nginx_db_subnet" {
  name        = "${var.rds_instance_identifier}-subnet-group"
  description = "Terraform RDS subnet group"
  subnet_ids  = aws_subnet.nginx_private_subnet.*.id
}
