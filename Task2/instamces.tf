resource "aws_instance" "nginx_server" {
  ami                    = var.aws_ami
  instance_type          = var.instance_type

  subnet_id              = aws_subnet.nginx_public_subnet[0].id
  vpc_security_group_ids = [ aws_security_group.nginx_sg.id ]

  user_data = <<-EOF
  #!/bin/bash -ex

  amazon-linux-extras install nginx -y
  echo "<h1>Ик, тест... меня видно ?</h1>" >  /usr/share/nginx/html/index.html 
  systemctl enable nginx
  systemctl start nginx
  EOF

  tags = merge (
    local.common_tags,
    {
        Name = "nginx_server"
    }
  )
}

resource "aws_db_instance" "default" {
  identifier                = var.rds_instance_identifier
  allocated_storage         = 5
  engine                    = var.database_engine
  engine_version            = var.database_varsion
  instance_class            = "db.t2.micro"
  name                      = var.database_name
  username                  = var.database_user
  password                  = var.database_password
  db_subnet_group_name      = aws_db_subnet_group.nginx_db_subnet.id
  vpc_security_group_ids    = [ aws_security_group.nginx_sg.id ]
  skip_final_snapshot       = true
  final_snapshot_identifier = "Ignore"
}
