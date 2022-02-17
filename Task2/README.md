# Home task 2 (deploy EC2 with DB instances)

Firstly let's look at the terraform plan:

<pre>┌─[ 4:41][][<font color="#4E9A06">alexLaptop</font>][<font color="#8AE234"><b>±</b></font>][main ?:1 <font color="#EF2929"><b>✗</b></font>]
├─[<font color="#06989A">~/_GIT/github/EPAM/devops-school-terraform/Task2</font>]
└─▪ terraform plan --var-file ./terraform.tfvars --var-file secrets.tfvars

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
the following symbols:
  <font color="#4E9A06">+</font> create

Terraform will perform the following actions:

<b>  # aws_db_instance.default</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_db_instance&quot; &quot;default&quot; {
      <font color="#4E9A06">+</font> address                               = (known after apply)
      <font color="#4E9A06">+</font> allocated_storage                     = 5
      <font color="#4E9A06">+</font> apply_immediately                     = (known after apply)
      <font color="#4E9A06">+</font> arn                                   = (known after apply)
      <font color="#4E9A06">+</font> auto_minor_version_upgrade            = true
      <font color="#4E9A06">+</font> availability_zone                     = (known after apply)
      <font color="#4E9A06">+</font> backup_retention_period               = (known after apply)
      <font color="#4E9A06">+</font> backup_window                         = (known after apply)
      <font color="#4E9A06">+</font> ca_cert_identifier                    = (known after apply)
      <font color="#4E9A06">+</font> character_set_name                    = (known after apply)
      <font color="#4E9A06">+</font> copy_tags_to_snapshot                 = false
      <font color="#4E9A06">+</font> db_subnet_group_name                  = (known after apply)
      <font color="#4E9A06">+</font> delete_automated_backups              = true
      <font color="#4E9A06">+</font> endpoint                              = (known after apply)
      <font color="#4E9A06">+</font> engine                                = &quot;mysql&quot;
      <font color="#4E9A06">+</font> engine_version                        = &quot;8.0.27&quot;
      <font color="#4E9A06">+</font> engine_version_actual                 = (known after apply)
      <font color="#4E9A06">+</font> final_snapshot_identifier             = &quot;Ignore&quot;
      <font color="#4E9A06">+</font> hosted_zone_id                        = (known after apply)
      <font color="#4E9A06">+</font> id                                    = (known after apply)
      <font color="#4E9A06">+</font> identifier                            = &quot;terraform-mysql&quot;
      <font color="#4E9A06">+</font> identifier_prefix                     = (known after apply)
      <font color="#4E9A06">+</font> instance_class                        = &quot;db.t2.micro&quot;
      <font color="#4E9A06">+</font> kms_key_id                            = (known after apply)
      <font color="#4E9A06">+</font> latest_restorable_time                = (known after apply)
      <font color="#4E9A06">+</font> license_model                         = (known after apply)
      <font color="#4E9A06">+</font> maintenance_window                    = (known after apply)
      <font color="#4E9A06">+</font> monitoring_interval                   = 0
      <font color="#4E9A06">+</font> monitoring_role_arn                   = (known after apply)
      <font color="#4E9A06">+</font> multi_az                              = (known after apply)
      <font color="#4E9A06">+</font> name                                  = &quot;terraform_test_db&quot;
      <font color="#4E9A06">+</font> nchar_character_set_name              = (known after apply)
      <font color="#4E9A06">+</font> option_group_name                     = (known after apply)
      <font color="#4E9A06">+</font> parameter_group_name                  = (known after apply)
      <font color="#4E9A06">+</font> password                              = (sensitive value)
      <font color="#4E9A06">+</font> performance_insights_enabled          = false
      <font color="#4E9A06">+</font> performance_insights_kms_key_id       = (known after apply)
      <font color="#4E9A06">+</font> performance_insights_retention_period = (known after apply)
      <font color="#4E9A06">+</font> port                                  = (known after apply)
      <font color="#4E9A06">+</font> publicly_accessible                   = false
      <font color="#4E9A06">+</font> replicas                              = (known after apply)
      <font color="#4E9A06">+</font> resource_id                           = (known after apply)
      <font color="#4E9A06">+</font> skip_final_snapshot                   = true
      <font color="#4E9A06">+</font> snapshot_identifier                   = (known after apply)
      <font color="#4E9A06">+</font> status                                = (known after apply)
      <font color="#4E9A06">+</font> storage_type                          = (known after apply)
      <font color="#4E9A06">+</font> tags_all                              = (known after apply)
      <font color="#4E9A06">+</font> timezone                              = (known after apply)
      <font color="#4E9A06">+</font> username                              = &quot;terraform&quot;
      <font color="#4E9A06">+</font> vpc_security_group_ids                = (known after apply)
    }

<b>  # aws_db_subnet_group.nginx_db_subnet</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_db_subnet_group&quot; &quot;nginx_db_subnet&quot; {
      <font color="#4E9A06">+</font> arn         = (known after apply)
      <font color="#4E9A06">+</font> description = &quot;Terraform RDS subnet group&quot;
      <font color="#4E9A06">+</font> id          = (known after apply)
      <font color="#4E9A06">+</font> name        = &quot;terraform-mysql-subnet-group&quot;
      <font color="#4E9A06">+</font> name_prefix = (known after apply)
      <font color="#4E9A06">+</font> subnet_ids  = (known after apply)
      <font color="#4E9A06">+</font> tags_all    = (known after apply)
    }

<b>  # aws_instance.nginx_server</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_instance&quot; &quot;nginx_server&quot; {
      <font color="#4E9A06">+</font> ami                                  = &quot;ami-0eb7496c2e0403237&quot;
      <font color="#4E9A06">+</font> arn                                  = (known after apply)
      <font color="#4E9A06">+</font> associate_public_ip_address          = (known after apply)
      <font color="#4E9A06">+</font> availability_zone                    = (known after apply)
      <font color="#4E9A06">+</font> cpu_core_count                       = (known after apply)
      <font color="#4E9A06">+</font> cpu_threads_per_core                 = (known after apply)
      <font color="#4E9A06">+</font> disable_api_termination              = (known after apply)
      <font color="#4E9A06">+</font> ebs_optimized                        = (known after apply)
      <font color="#4E9A06">+</font> get_password_data                    = false
      <font color="#4E9A06">+</font> host_id                              = (known after apply)
      <font color="#4E9A06">+</font> id                                   = (known after apply)
      <font color="#4E9A06">+</font> instance_initiated_shutdown_behavior = (known after apply)
      <font color="#4E9A06">+</font> instance_state                       = (known after apply)
      <font color="#4E9A06">+</font> instance_type                        = &quot;t2.micro&quot;
      <font color="#4E9A06">+</font> ipv6_address_count                   = (known after apply)
      <font color="#4E9A06">+</font> ipv6_addresses                       = (known after apply)
      <font color="#4E9A06">+</font> key_name                             = (known after apply)
      <font color="#4E9A06">+</font> monitoring                           = (known after apply)
      <font color="#4E9A06">+</font> outpost_arn                          = (known after apply)
      <font color="#4E9A06">+</font> password_data                        = (known after apply)
      <font color="#4E9A06">+</font> placement_group                      = (known after apply)
      <font color="#4E9A06">+</font> placement_partition_number           = (known after apply)
      <font color="#4E9A06">+</font> primary_network_interface_id         = (known after apply)
      <font color="#4E9A06">+</font> private_dns                          = (known after apply)
      <font color="#4E9A06">+</font> private_ip                           = (known after apply)
      <font color="#4E9A06">+</font> public_dns                           = (known after apply)
      <font color="#4E9A06">+</font> public_ip                            = (known after apply)
      <font color="#4E9A06">+</font> secondary_private_ips                = (known after apply)
      <font color="#4E9A06">+</font> security_groups                      = (known after apply)
      <font color="#4E9A06">+</font> source_dest_check                    = true
      <font color="#4E9A06">+</font> subnet_id                            = (known after apply)
      <font color="#4E9A06">+</font> tags                                 = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_server&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tags_all                             = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_server&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tenancy                              = (known after apply)
      <font color="#4E9A06">+</font> user_data                            = &quot;64779120b06e8649f85b3914ce7d0e6343f2fff4&quot;
      <font color="#4E9A06">+</font> user_data_base64                     = (known after apply)
      <font color="#4E9A06">+</font> vpc_security_group_ids               = (known after apply)

      <font color="#4E9A06">+</font> capacity_reservation_specification {
          <font color="#4E9A06">+</font> capacity_reservation_preference = (known after apply)

          <font color="#4E9A06">+</font> capacity_reservation_target {
              <font color="#4E9A06">+</font> capacity_reservation_id = (known after apply)
            }
        }

      <font color="#4E9A06">+</font> ebs_block_device {
          <font color="#4E9A06">+</font> delete_on_termination = (known after apply)
          <font color="#4E9A06">+</font> device_name           = (known after apply)
          <font color="#4E9A06">+</font> encrypted             = (known after apply)
          <font color="#4E9A06">+</font> iops                  = (known after apply)
          <font color="#4E9A06">+</font> kms_key_id            = (known after apply)
          <font color="#4E9A06">+</font> snapshot_id           = (known after apply)
          <font color="#4E9A06">+</font> tags                  = (known after apply)
          <font color="#4E9A06">+</font> throughput            = (known after apply)
          <font color="#4E9A06">+</font> volume_id             = (known after apply)
          <font color="#4E9A06">+</font> volume_size           = (known after apply)
          <font color="#4E9A06">+</font> volume_type           = (known after apply)
        }

      <font color="#4E9A06">+</font> enclave_options {
          <font color="#4E9A06">+</font> enabled = (known after apply)
        }

      <font color="#4E9A06">+</font> ephemeral_block_device {
          <font color="#4E9A06">+</font> device_name  = (known after apply)
          <font color="#4E9A06">+</font> no_device    = (known after apply)
          <font color="#4E9A06">+</font> virtual_name = (known after apply)
        }

      <font color="#4E9A06">+</font> metadata_options {
          <font color="#4E9A06">+</font> http_endpoint               = (known after apply)
          <font color="#4E9A06">+</font> http_put_response_hop_limit = (known after apply)
          <font color="#4E9A06">+</font> http_tokens                 = (known after apply)
          <font color="#4E9A06">+</font> instance_metadata_tags      = (known after apply)
        }

      <font color="#4E9A06">+</font> network_interface {
          <font color="#4E9A06">+</font> delete_on_termination = (known after apply)
          <font color="#4E9A06">+</font> device_index          = (known after apply)
          <font color="#4E9A06">+</font> network_interface_id  = (known after apply)
        }

      <font color="#4E9A06">+</font> root_block_device {
          <font color="#4E9A06">+</font> delete_on_termination = (known after apply)
          <font color="#4E9A06">+</font> device_name           = (known after apply)
          <font color="#4E9A06">+</font> encrypted             = (known after apply)
          <font color="#4E9A06">+</font> iops                  = (known after apply)
          <font color="#4E9A06">+</font> kms_key_id            = (known after apply)
          <font color="#4E9A06">+</font> tags                  = (known after apply)
          <font color="#4E9A06">+</font> throughput            = (known after apply)
          <font color="#4E9A06">+</font> volume_id             = (known after apply)
          <font color="#4E9A06">+</font> volume_size           = (known after apply)
          <font color="#4E9A06">+</font> volume_type           = (known after apply)
        }
    }

<b>  # aws_internet_gateway.nginx_igw</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_internet_gateway&quot; &quot;nginx_igw&quot; {
      <font color="#4E9A06">+</font> arn      = (known after apply)
      <font color="#4E9A06">+</font> id       = (known after apply)
      <font color="#4E9A06">+</font> owner_id = (known after apply)
      <font color="#4E9A06">+</font> tags     = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_internet_gateway&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tags_all = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_internet_gateway&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> vpc_id   = (known after apply)
    }

<b>  # aws_route_table.nginx_public_rt</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_route_table&quot; &quot;nginx_public_rt&quot; {
      <font color="#4E9A06">+</font> arn              = (known after apply)
      <font color="#4E9A06">+</font> id               = (known after apply)
      <font color="#4E9A06">+</font> owner_id         = (known after apply)
      <font color="#4E9A06">+</font> propagating_vgws = (known after apply)
      <font color="#4E9A06">+</font> route            = [
          <font color="#4E9A06">+</font> {
              <font color="#4E9A06">+</font> carrier_gateway_id         = &quot;&quot;
              <font color="#4E9A06">+</font> cidr_block                 = &quot;&quot;
              <font color="#4E9A06">+</font> destination_prefix_list_id = &quot;&quot;
              <font color="#4E9A06">+</font> egress_only_gateway_id     = &quot;&quot;
              <font color="#4E9A06">+</font> gateway_id                 = (known after apply)
              <font color="#4E9A06">+</font> instance_id                = &quot;&quot;
              <font color="#4E9A06">+</font> ipv6_cidr_block            = &quot;::/0&quot;
              <font color="#4E9A06">+</font> local_gateway_id           = &quot;&quot;
              <font color="#4E9A06">+</font> nat_gateway_id             = &quot;&quot;
              <font color="#4E9A06">+</font> network_interface_id       = &quot;&quot;
              <font color="#4E9A06">+</font> transit_gateway_id         = &quot;&quot;
              <font color="#4E9A06">+</font> vpc_endpoint_id            = &quot;&quot;
              <font color="#4E9A06">+</font> vpc_peering_connection_id  = &quot;&quot;
            },
          <font color="#4E9A06">+</font> {
              <font color="#4E9A06">+</font> carrier_gateway_id         = &quot;&quot;
              <font color="#4E9A06">+</font> cidr_block                 = &quot;0.0.0.0/0&quot;
              <font color="#4E9A06">+</font> destination_prefix_list_id = &quot;&quot;
              <font color="#4E9A06">+</font> egress_only_gateway_id     = &quot;&quot;
              <font color="#4E9A06">+</font> gateway_id                 = (known after apply)
              <font color="#4E9A06">+</font> instance_id                = &quot;&quot;
              <font color="#4E9A06">+</font> ipv6_cidr_block            = &quot;&quot;
              <font color="#4E9A06">+</font> local_gateway_id           = &quot;&quot;
              <font color="#4E9A06">+</font> nat_gateway_id             = &quot;&quot;
              <font color="#4E9A06">+</font> network_interface_id       = &quot;&quot;
              <font color="#4E9A06">+</font> transit_gateway_id         = &quot;&quot;
              <font color="#4E9A06">+</font> vpc_endpoint_id            = &quot;&quot;
              <font color="#4E9A06">+</font> vpc_peering_connection_id  = &quot;&quot;
            },
        ]
      <font color="#4E9A06">+</font> tags             = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_public_rt&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tags_all         = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_public_rt&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> vpc_id           = (known after apply)
    }

<b>  # aws_route_table_association.nginx_public_1_rt_a</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_route_table_association&quot; &quot;nginx_public_1_rt_a&quot; {
      <font color="#4E9A06">+</font> id             = (known after apply)
      <font color="#4E9A06">+</font> route_table_id = (known after apply)
      <font color="#4E9A06">+</font> subnet_id      = (known after apply)
    }

<b>  # aws_security_group.mysql_sg</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_security_group&quot; &quot;mysql_sg&quot; {
      <font color="#4E9A06">+</font> arn                    = (known after apply)
      <font color="#4E9A06">+</font> description            = &quot;Managed by Terraform&quot;
      <font color="#4E9A06">+</font> egress                 = [
          <font color="#4E9A06">+</font> {
              <font color="#4E9A06">+</font> cidr_blocks      = [
                  <font color="#4E9A06">+</font> &quot;0.0.0.0/0&quot;,
                ]
              <font color="#4E9A06">+</font> description      = &quot;&quot;
              <font color="#4E9A06">+</font> from_port        = 0
              <font color="#4E9A06">+</font> ipv6_cidr_blocks = []
              <font color="#4E9A06">+</font> prefix_list_ids  = []
              <font color="#4E9A06">+</font> protocol         = &quot;-1&quot;
              <font color="#4E9A06">+</font> security_groups  = []
              <font color="#4E9A06">+</font> self             = false
              <font color="#4E9A06">+</font> to_port          = 0
            },
        ]
      <font color="#4E9A06">+</font> id                     = (known after apply)
      <font color="#4E9A06">+</font> ingress                = [
          <font color="#4E9A06">+</font> {
              <font color="#4E9A06">+</font> cidr_blocks      = []
              <font color="#4E9A06">+</font> description      = &quot;&quot;
              <font color="#4E9A06">+</font> from_port        = 3306
              <font color="#4E9A06">+</font> ipv6_cidr_blocks = []
              <font color="#4E9A06">+</font> prefix_list_ids  = []
              <font color="#4E9A06">+</font> protocol         = &quot;tcp&quot;
              <font color="#4E9A06">+</font> security_groups  = (known after apply)
              <font color="#4E9A06">+</font> self             = false
              <font color="#4E9A06">+</font> to_port          = 3306
            },
        ]
      <font color="#4E9A06">+</font> name                   = &quot;mysql_security_group&quot;
      <font color="#4E9A06">+</font> name_prefix            = (known after apply)
      <font color="#4E9A06">+</font> owner_id               = (known after apply)
      <font color="#4E9A06">+</font> revoke_rules_on_delete = false
      <font color="#4E9A06">+</font> tags                   = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;mysql_security_group&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tags_all               = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;mysql_security_group&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> vpc_id                 = (known after apply)
    }

<b>  # aws_security_group.nginx_sg</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_security_group&quot; &quot;nginx_sg&quot; {
      <font color="#4E9A06">+</font> arn                    = (known after apply)
      <font color="#4E9A06">+</font> description            = &quot;Managed by Terraform&quot;
      <font color="#4E9A06">+</font> egress                 = [
          <font color="#4E9A06">+</font> {
              <font color="#4E9A06">+</font> cidr_blocks      = [
                  <font color="#4E9A06">+</font> &quot;0.0.0.0/0&quot;,
                ]
              <font color="#4E9A06">+</font> description      = &quot;&quot;
              <font color="#4E9A06">+</font> from_port        = 0
              <font color="#4E9A06">+</font> ipv6_cidr_blocks = []
              <font color="#4E9A06">+</font> prefix_list_ids  = []
              <font color="#4E9A06">+</font> protocol         = &quot;-1&quot;
              <font color="#4E9A06">+</font> security_groups  = []
              <font color="#4E9A06">+</font> self             = false
              <font color="#4E9A06">+</font> to_port          = 0
            },
        ]
      <font color="#4E9A06">+</font> id                     = (known after apply)
      <font color="#4E9A06">+</font> ingress                = [
          <font color="#4E9A06">+</font> {
              <font color="#4E9A06">+</font> cidr_blocks      = [
                  <font color="#4E9A06">+</font> &quot;0.0.0.0/0&quot;,
                ]
              <font color="#4E9A06">+</font> description      = &quot;&quot;
              <font color="#4E9A06">+</font> from_port        = 22
              <font color="#4E9A06">+</font> ipv6_cidr_blocks = []
              <font color="#4E9A06">+</font> prefix_list_ids  = []
              <font color="#4E9A06">+</font> protocol         = &quot;tcp&quot;
              <font color="#4E9A06">+</font> security_groups  = []
              <font color="#4E9A06">+</font> self             = false
              <font color="#4E9A06">+</font> to_port          = 22
            },
          <font color="#4E9A06">+</font> {
              <font color="#4E9A06">+</font> cidr_blocks      = [
                  <font color="#4E9A06">+</font> &quot;0.0.0.0/0&quot;,
                ]
              <font color="#4E9A06">+</font> description      = &quot;&quot;
              <font color="#4E9A06">+</font> from_port        = 80
              <font color="#4E9A06">+</font> ipv6_cidr_blocks = []
              <font color="#4E9A06">+</font> prefix_list_ids  = []
              <font color="#4E9A06">+</font> protocol         = &quot;tcp&quot;
              <font color="#4E9A06">+</font> security_groups  = []
              <font color="#4E9A06">+</font> self             = false
              <font color="#4E9A06">+</font> to_port          = 80
            },
        ]
      <font color="#4E9A06">+</font> name                   = &quot;HTTP and SSH&quot;
      <font color="#4E9A06">+</font> name_prefix            = (known after apply)
      <font color="#4E9A06">+</font> owner_id               = (known after apply)
      <font color="#4E9A06">+</font> revoke_rules_on_delete = false
      <font color="#4E9A06">+</font> tags                   = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_security_group&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tags_all               = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_security_group&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> vpc_id                 = (known after apply)
    }

<b>  # aws_subnet.nginx_private_subnet[0]</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_subnet&quot; &quot;nginx_private_subnet&quot; {
      <font color="#4E9A06">+</font> arn                                            = (known after apply)
      <font color="#4E9A06">+</font> assign_ipv6_address_on_creation                = false
      <font color="#4E9A06">+</font> availability_zone                              = &quot;eu-central-1a&quot;
      <font color="#4E9A06">+</font> availability_zone_id                           = (known after apply)
      <font color="#4E9A06">+</font> cidr_block                                     = &quot;10.0.3.0/24&quot;
      <font color="#4E9A06">+</font> enable_dns64                                   = false
      <font color="#4E9A06">+</font> enable_resource_name_dns_a_record_on_launch    = false
      <font color="#4E9A06">+</font> enable_resource_name_dns_aaaa_record_on_launch = false
      <font color="#4E9A06">+</font> id                                             = (known after apply)
      <font color="#4E9A06">+</font> ipv6_cidr_block_association_id                 = (known after apply)
      <font color="#4E9A06">+</font> ipv6_native                                    = false
      <font color="#4E9A06">+</font> map_public_ip_on_launch                        = false
      <font color="#4E9A06">+</font> owner_id                                       = (known after apply)
      <font color="#4E9A06">+</font> private_dns_hostname_type_on_launch            = (known after apply)
      <font color="#4E9A06">+</font> tags                                           = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_private_subnet-eu-central-1a&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tags_all                                       = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_private_subnet-eu-central-1a&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> vpc_id                                         = (known after apply)
    }

<b>  # aws_subnet.nginx_private_subnet[1]</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_subnet&quot; &quot;nginx_private_subnet&quot; {
      <font color="#4E9A06">+</font> arn                                            = (known after apply)
      <font color="#4E9A06">+</font> assign_ipv6_address_on_creation                = false
      <font color="#4E9A06">+</font> availability_zone                              = &quot;eu-central-1b&quot;
      <font color="#4E9A06">+</font> availability_zone_id                           = (known after apply)
      <font color="#4E9A06">+</font> cidr_block                                     = &quot;10.0.4.0/24&quot;
      <font color="#4E9A06">+</font> enable_dns64                                   = false
      <font color="#4E9A06">+</font> enable_resource_name_dns_a_record_on_launch    = false
      <font color="#4E9A06">+</font> enable_resource_name_dns_aaaa_record_on_launch = false
      <font color="#4E9A06">+</font> id                                             = (known after apply)
      <font color="#4E9A06">+</font> ipv6_cidr_block_association_id                 = (known after apply)
      <font color="#4E9A06">+</font> ipv6_native                                    = false
      <font color="#4E9A06">+</font> map_public_ip_on_launch                        = false
      <font color="#4E9A06">+</font> owner_id                                       = (known after apply)
      <font color="#4E9A06">+</font> private_dns_hostname_type_on_launch            = (known after apply)
      <font color="#4E9A06">+</font> tags                                           = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_private_subnet-eu-central-1b&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tags_all                                       = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_private_subnet-eu-central-1b&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> vpc_id                                         = (known after apply)
    }

<b>  # aws_subnet.nginx_private_subnet[2]</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_subnet&quot; &quot;nginx_private_subnet&quot; {
      <font color="#4E9A06">+</font> arn                                            = (known after apply)
      <font color="#4E9A06">+</font> assign_ipv6_address_on_creation                = false
      <font color="#4E9A06">+</font> availability_zone                              = &quot;eu-central-1c&quot;
      <font color="#4E9A06">+</font> availability_zone_id                           = (known after apply)
      <font color="#4E9A06">+</font> cidr_block                                     = &quot;10.0.5.0/24&quot;
      <font color="#4E9A06">+</font> enable_dns64                                   = false
      <font color="#4E9A06">+</font> enable_resource_name_dns_a_record_on_launch    = false
      <font color="#4E9A06">+</font> enable_resource_name_dns_aaaa_record_on_launch = false
      <font color="#4E9A06">+</font> id                                             = (known after apply)
      <font color="#4E9A06">+</font> ipv6_cidr_block_association_id                 = (known after apply)
      <font color="#4E9A06">+</font> ipv6_native                                    = false
      <font color="#4E9A06">+</font> map_public_ip_on_launch                        = false
      <font color="#4E9A06">+</font> owner_id                                       = (known after apply)
      <font color="#4E9A06">+</font> private_dns_hostname_type_on_launch            = (known after apply)
      <font color="#4E9A06">+</font> tags                                           = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_private_subnet-eu-central-1c&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tags_all                                       = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_private_subnet-eu-central-1c&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> vpc_id                                         = (known after apply)
    }

<b>  # aws_subnet.nginx_public_subnet[0]</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_subnet&quot; &quot;nginx_public_subnet&quot; {
      <font color="#4E9A06">+</font> arn                                            = (known after apply)
      <font color="#4E9A06">+</font> assign_ipv6_address_on_creation                = false
      <font color="#4E9A06">+</font> availability_zone                              = &quot;eu-central-1a&quot;
      <font color="#4E9A06">+</font> availability_zone_id                           = (known after apply)
      <font color="#4E9A06">+</font> cidr_block                                     = &quot;10.0.0.0/24&quot;
      <font color="#4E9A06">+</font> enable_dns64                                   = false
      <font color="#4E9A06">+</font> enable_resource_name_dns_a_record_on_launch    = false
      <font color="#4E9A06">+</font> enable_resource_name_dns_aaaa_record_on_launch = false
      <font color="#4E9A06">+</font> id                                             = (known after apply)
      <font color="#4E9A06">+</font> ipv6_cidr_block_association_id                 = (known after apply)
      <font color="#4E9A06">+</font> ipv6_native                                    = false
      <font color="#4E9A06">+</font> map_public_ip_on_launch                        = true
      <font color="#4E9A06">+</font> owner_id                                       = (known after apply)
      <font color="#4E9A06">+</font> private_dns_hostname_type_on_launch            = (known after apply)
      <font color="#4E9A06">+</font> tags                                           = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_public_subnet-eu-central-1a&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tags_all                                       = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_public_subnet-eu-central-1a&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> vpc_id                                         = (known after apply)
    }

<b>  # aws_subnet.nginx_public_subnet[1]</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_subnet&quot; &quot;nginx_public_subnet&quot; {
      <font color="#4E9A06">+</font> arn                                            = (known after apply)
      <font color="#4E9A06">+</font> assign_ipv6_address_on_creation                = false
      <font color="#4E9A06">+</font> availability_zone                              = &quot;eu-central-1b&quot;
      <font color="#4E9A06">+</font> availability_zone_id                           = (known after apply)
      <font color="#4E9A06">+</font> cidr_block                                     = &quot;10.0.1.0/24&quot;
      <font color="#4E9A06">+</font> enable_dns64                                   = false
      <font color="#4E9A06">+</font> enable_resource_name_dns_a_record_on_launch    = false
      <font color="#4E9A06">+</font> enable_resource_name_dns_aaaa_record_on_launch = false
      <font color="#4E9A06">+</font> id                                             = (known after apply)
      <font color="#4E9A06">+</font> ipv6_cidr_block_association_id                 = (known after apply)
      <font color="#4E9A06">+</font> ipv6_native                                    = false
      <font color="#4E9A06">+</font> map_public_ip_on_launch                        = true
      <font color="#4E9A06">+</font> owner_id                                       = (known after apply)
      <font color="#4E9A06">+</font> private_dns_hostname_type_on_launch            = (known after apply)
      <font color="#4E9A06">+</font> tags                                           = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_public_subnet-eu-central-1b&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tags_all                                       = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_public_subnet-eu-central-1b&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> vpc_id                                         = (known after apply)
    }

<b>  # aws_subnet.nginx_public_subnet[2]</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_subnet&quot; &quot;nginx_public_subnet&quot; {
      <font color="#4E9A06">+</font> arn                                            = (known after apply)
      <font color="#4E9A06">+</font> assign_ipv6_address_on_creation                = false
      <font color="#4E9A06">+</font> availability_zone                              = &quot;eu-central-1c&quot;
      <font color="#4E9A06">+</font> availability_zone_id                           = (known after apply)
      <font color="#4E9A06">+</font> cidr_block                                     = &quot;10.0.2.0/24&quot;
      <font color="#4E9A06">+</font> enable_dns64                                   = false
      <font color="#4E9A06">+</font> enable_resource_name_dns_a_record_on_launch    = false
      <font color="#4E9A06">+</font> enable_resource_name_dns_aaaa_record_on_launch = false
      <font color="#4E9A06">+</font> id                                             = (known after apply)
      <font color="#4E9A06">+</font> ipv6_cidr_block_association_id                 = (known after apply)
      <font color="#4E9A06">+</font> ipv6_native                                    = false
      <font color="#4E9A06">+</font> map_public_ip_on_launch                        = true
      <font color="#4E9A06">+</font> owner_id                                       = (known after apply)
      <font color="#4E9A06">+</font> private_dns_hostname_type_on_launch            = (known after apply)
      <font color="#4E9A06">+</font> tags                                           = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_public_subnet-eu-central-1c&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tags_all                                       = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_public_subnet-eu-central-1c&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> vpc_id                                         = (known after apply)
    }

<b>  # aws_vpc.nginx_test_vpc</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_vpc&quot; &quot;nginx_test_vpc&quot; {
      <font color="#4E9A06">+</font> arn                                  = (known after apply)
      <font color="#4E9A06">+</font> cidr_block                           = &quot;10.0.0.0/16&quot;
      <font color="#4E9A06">+</font> default_network_acl_id               = (known after apply)
      <font color="#4E9A06">+</font> default_route_table_id               = (known after apply)
      <font color="#4E9A06">+</font> default_security_group_id            = (known after apply)
      <font color="#4E9A06">+</font> dhcp_options_id                      = (known after apply)
      <font color="#4E9A06">+</font> enable_classiclink                   = (known after apply)
      <font color="#4E9A06">+</font> enable_classiclink_dns_support       = (known after apply)
      <font color="#4E9A06">+</font> enable_dns_hostnames                 = (known after apply)
      <font color="#4E9A06">+</font> enable_dns_support                   = true
      <font color="#4E9A06">+</font> id                                   = (known after apply)
      <font color="#4E9A06">+</font> instance_tenancy                     = &quot;default&quot;
      <font color="#4E9A06">+</font> ipv6_association_id                  = (known after apply)
      <font color="#4E9A06">+</font> ipv6_cidr_block                      = (known after apply)
      <font color="#4E9A06">+</font> ipv6_cidr_block_network_border_group = (known after apply)
      <font color="#4E9A06">+</font> main_route_table_id                  = (known after apply)
      <font color="#4E9A06">+</font> owner_id                             = (known after apply)
      <font color="#4E9A06">+</font> tags                                 = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_test_vpc&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tags_all                             = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_test_vpc&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
    }

<b>Plan:</b> 15 to add, 0 to change, 0 to destroy.

<font color="#555753">────────────────────────────────────────────────────────────────────────────────────────────────────────────────────</font>

Note: You didn&apos;t use the -out option to save this plan, so Terraform can&apos;t guarantee to take exactly these actions
if you run &quot;terraform apply&quot; now.

</pre>

Then let's apply it.

<pre>
┌─[ 4:42][][<font color="#4E9A06">alexLaptop</font>][<font color="#8AE234"><b>±</b></font>][main ?:1 <font color="#EF2929"><b>✗</b></font>]
├─[<font color="#06989A">~/_GIT/github/EPAM/devops-school-terraform/Task2</font>]
└─▪ terraform apply --var-file ./terraform.tfvars --var-file secrets.tfvars

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
the following symbols:
  <font color="#4E9A06">+</font> create

Terraform will perform the following actions:

<b>  # aws_db_instance.default</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_db_instance&quot; &quot;default&quot; {
      <font color="#4E9A06">+</font> address                               = (known after apply)
      <font color="#4E9A06">+</font> allocated_storage                     = 5
      <font color="#4E9A06">+</font> apply_immediately                     = (known after apply)
      <font color="#4E9A06">+</font> arn                                   = (known after apply)
      <font color="#4E9A06">+</font> auto_minor_version_upgrade            = true
      <font color="#4E9A06">+</font> availability_zone                     = (known after apply)
      <font color="#4E9A06">+</font> backup_retention_period               = (known after apply)
      <font color="#4E9A06">+</font> backup_window                         = (known after apply)
      <font color="#4E9A06">+</font> ca_cert_identifier                    = (known after apply)
      <font color="#4E9A06">+</font> character_set_name                    = (known after apply)
      <font color="#4E9A06">+</font> copy_tags_to_snapshot                 = false
      <font color="#4E9A06">+</font> db_subnet_group_name                  = (known after apply)
      <font color="#4E9A06">+</font> delete_automated_backups              = true
      <font color="#4E9A06">+</font> endpoint                              = (known after apply)
      <font color="#4E9A06">+</font> engine                                = &quot;mysql&quot;
      <font color="#4E9A06">+</font> engine_version                        = &quot;8.0.27&quot;
      <font color="#4E9A06">+</font> engine_version_actual                 = (known after apply)
      <font color="#4E9A06">+</font> final_snapshot_identifier             = &quot;Ignore&quot;
      <font color="#4E9A06">+</font> hosted_zone_id                        = (known after apply)
      <font color="#4E9A06">+</font> id                                    = (known after apply)
      <font color="#4E9A06">+</font> identifier                            = &quot;terraform-mysql&quot;
      <font color="#4E9A06">+</font> identifier_prefix                     = (known after apply)
      <font color="#4E9A06">+</font> instance_class                        = &quot;db.t2.micro&quot;
      <font color="#4E9A06">+</font> kms_key_id                            = (known after apply)
      <font color="#4E9A06">+</font> latest_restorable_time                = (known after apply)
      <font color="#4E9A06">+</font> license_model                         = (known after apply)
      <font color="#4E9A06">+</font> maintenance_window                    = (known after apply)
      <font color="#4E9A06">+</font> monitoring_interval                   = 0
      <font color="#4E9A06">+</font> monitoring_role_arn                   = (known after apply)
      <font color="#4E9A06">+</font> multi_az                              = (known after apply)
      <font color="#4E9A06">+</font> name                                  = &quot;terraform_test_db&quot;
      <font color="#4E9A06">+</font> nchar_character_set_name              = (known after apply)
      <font color="#4E9A06">+</font> option_group_name                     = (known after apply)
      <font color="#4E9A06">+</font> parameter_group_name                  = (known after apply)
      <font color="#4E9A06">+</font> password                              = (sensitive value)
      <font color="#4E9A06">+</font> performance_insights_enabled          = false
      <font color="#4E9A06">+</font> performance_insights_kms_key_id       = (known after apply)
      <font color="#4E9A06">+</font> performance_insights_retention_period = (known after apply)
      <font color="#4E9A06">+</font> port                                  = (known after apply)
      <font color="#4E9A06">+</font> publicly_accessible                   = false
      <font color="#4E9A06">+</font> replicas                              = (known after apply)
      <font color="#4E9A06">+</font> resource_id                           = (known after apply)
      <font color="#4E9A06">+</font> skip_final_snapshot                   = true
      <font color="#4E9A06">+</font> snapshot_identifier                   = (known after apply)
      <font color="#4E9A06">+</font> status                                = (known after apply)
      <font color="#4E9A06">+</font> storage_type                          = (known after apply)
      <font color="#4E9A06">+</font> tags_all                              = (known after apply)
      <font color="#4E9A06">+</font> timezone                              = (known after apply)
      <font color="#4E9A06">+</font> username                              = &quot;terraform&quot;
      <font color="#4E9A06">+</font> vpc_security_group_ids                = (known after apply)
    }

<b>  # aws_db_subnet_group.nginx_db_subnet</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_db_subnet_group&quot; &quot;nginx_db_subnet&quot; {
      <font color="#4E9A06">+</font> arn         = (known after apply)
      <font color="#4E9A06">+</font> description = &quot;Terraform RDS subnet group&quot;
      <font color="#4E9A06">+</font> id          = (known after apply)
      <font color="#4E9A06">+</font> name        = &quot;terraform-mysql-subnet-group&quot;
      <font color="#4E9A06">+</font> name_prefix = (known after apply)
      <font color="#4E9A06">+</font> subnet_ids  = (known after apply)
      <font color="#4E9A06">+</font> tags_all    = (known after apply)
    }

<b>  # aws_instance.nginx_server</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_instance&quot; &quot;nginx_server&quot; {
      <font color="#4E9A06">+</font> ami                                  = &quot;ami-0eb7496c2e0403237&quot;
      <font color="#4E9A06">+</font> arn                                  = (known after apply)
      <font color="#4E9A06">+</font> associate_public_ip_address          = (known after apply)
      <font color="#4E9A06">+</font> availability_zone                    = (known after apply)
      <font color="#4E9A06">+</font> cpu_core_count                       = (known after apply)
      <font color="#4E9A06">+</font> cpu_threads_per_core                 = (known after apply)
      <font color="#4E9A06">+</font> disable_api_termination              = (known after apply)
      <font color="#4E9A06">+</font> ebs_optimized                        = (known after apply)
      <font color="#4E9A06">+</font> get_password_data                    = false
      <font color="#4E9A06">+</font> host_id                              = (known after apply)
      <font color="#4E9A06">+</font> id                                   = (known after apply)
      <font color="#4E9A06">+</font> instance_initiated_shutdown_behavior = (known after apply)
      <font color="#4E9A06">+</font> instance_state                       = (known after apply)
      <font color="#4E9A06">+</font> instance_type                        = &quot;t2.micro&quot;
      <font color="#4E9A06">+</font> ipv6_address_count                   = (known after apply)
      <font color="#4E9A06">+</font> ipv6_addresses                       = (known after apply)
      <font color="#4E9A06">+</font> key_name                             = (known after apply)
      <font color="#4E9A06">+</font> monitoring                           = (known after apply)
      <font color="#4E9A06">+</font> outpost_arn                          = (known after apply)
      <font color="#4E9A06">+</font> password_data                        = (known after apply)
      <font color="#4E9A06">+</font> placement_group                      = (known after apply)
      <font color="#4E9A06">+</font> placement_partition_number           = (known after apply)
      <font color="#4E9A06">+</font> primary_network_interface_id         = (known after apply)
      <font color="#4E9A06">+</font> private_dns                          = (known after apply)
      <font color="#4E9A06">+</font> private_ip                           = (known after apply)
      <font color="#4E9A06">+</font> public_dns                           = (known after apply)
      <font color="#4E9A06">+</font> public_ip                            = (known after apply)
      <font color="#4E9A06">+</font> secondary_private_ips                = (known after apply)
      <font color="#4E9A06">+</font> security_groups                      = (known after apply)
      <font color="#4E9A06">+</font> source_dest_check                    = true
      <font color="#4E9A06">+</font> subnet_id                            = (known after apply)
      <font color="#4E9A06">+</font> tags                                 = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_server&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tags_all                             = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_server&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tenancy                              = (known after apply)
      <font color="#4E9A06">+</font> user_data                            = &quot;64779120b06e8649f85b3914ce7d0e6343f2fff4&quot;
      <font color="#4E9A06">+</font> user_data_base64                     = (known after apply)
      <font color="#4E9A06">+</font> vpc_security_group_ids               = (known after apply)

      <font color="#4E9A06">+</font> capacity_reservation_specification {
          <font color="#4E9A06">+</font> capacity_reservation_preference = (known after apply)

          <font color="#4E9A06">+</font> capacity_reservation_target {
              <font color="#4E9A06">+</font> capacity_reservation_id = (known after apply)
            }
        }

      <font color="#4E9A06">+</font> ebs_block_device {
          <font color="#4E9A06">+</font> delete_on_termination = (known after apply)
          <font color="#4E9A06">+</font> device_name           = (known after apply)
          <font color="#4E9A06">+</font> encrypted             = (known after apply)
          <font color="#4E9A06">+</font> iops                  = (known after apply)
          <font color="#4E9A06">+</font> kms_key_id            = (known after apply)
          <font color="#4E9A06">+</font> snapshot_id           = (known after apply)
          <font color="#4E9A06">+</font> tags                  = (known after apply)
          <font color="#4E9A06">+</font> throughput            = (known after apply)
          <font color="#4E9A06">+</font> volume_id             = (known after apply)
          <font color="#4E9A06">+</font> volume_size           = (known after apply)
          <font color="#4E9A06">+</font> volume_type           = (known after apply)
        }

      <font color="#4E9A06">+</font> enclave_options {
          <font color="#4E9A06">+</font> enabled = (known after apply)
        }

      <font color="#4E9A06">+</font> ephemeral_block_device {
          <font color="#4E9A06">+</font> device_name  = (known after apply)
          <font color="#4E9A06">+</font> no_device    = (known after apply)
          <font color="#4E9A06">+</font> virtual_name = (known after apply)
        }

      <font color="#4E9A06">+</font> metadata_options {
          <font color="#4E9A06">+</font> http_endpoint               = (known after apply)
          <font color="#4E9A06">+</font> http_put_response_hop_limit = (known after apply)
          <font color="#4E9A06">+</font> http_tokens                 = (known after apply)
          <font color="#4E9A06">+</font> instance_metadata_tags      = (known after apply)
        }

      <font color="#4E9A06">+</font> network_interface {
          <font color="#4E9A06">+</font> delete_on_termination = (known after apply)
          <font color="#4E9A06">+</font> device_index          = (known after apply)
          <font color="#4E9A06">+</font> network_interface_id  = (known after apply)
        }

      <font color="#4E9A06">+</font> root_block_device {
          <font color="#4E9A06">+</font> delete_on_termination = (known after apply)
          <font color="#4E9A06">+</font> device_name           = (known after apply)
          <font color="#4E9A06">+</font> encrypted             = (known after apply)
          <font color="#4E9A06">+</font> iops                  = (known after apply)
          <font color="#4E9A06">+</font> kms_key_id            = (known after apply)
          <font color="#4E9A06">+</font> tags                  = (known after apply)
          <font color="#4E9A06">+</font> throughput            = (known after apply)
          <font color="#4E9A06">+</font> volume_id             = (known after apply)
          <font color="#4E9A06">+</font> volume_size           = (known after apply)
          <font color="#4E9A06">+</font> volume_type           = (known after apply)
        }
    }

<b>  # aws_internet_gateway.nginx_igw</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_internet_gateway&quot; &quot;nginx_igw&quot; {
      <font color="#4E9A06">+</font> arn      = (known after apply)
      <font color="#4E9A06">+</font> id       = (known after apply)
      <font color="#4E9A06">+</font> owner_id = (known after apply)
      <font color="#4E9A06">+</font> tags     = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_internet_gateway&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tags_all = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_internet_gateway&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> vpc_id   = (known after apply)
    }

<b>  # aws_route_table.nginx_public_rt</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_route_table&quot; &quot;nginx_public_rt&quot; {
      <font color="#4E9A06">+</font> arn              = (known after apply)
      <font color="#4E9A06">+</font> id               = (known after apply)
      <font color="#4E9A06">+</font> owner_id         = (known after apply)
      <font color="#4E9A06">+</font> propagating_vgws = (known after apply)
      <font color="#4E9A06">+</font> route            = [
          <font color="#4E9A06">+</font> {
              <font color="#4E9A06">+</font> carrier_gateway_id         = &quot;&quot;
              <font color="#4E9A06">+</font> cidr_block                 = &quot;&quot;
              <font color="#4E9A06">+</font> destination_prefix_list_id = &quot;&quot;
              <font color="#4E9A06">+</font> egress_only_gateway_id     = &quot;&quot;
              <font color="#4E9A06">+</font> gateway_id                 = (known after apply)
              <font color="#4E9A06">+</font> instance_id                = &quot;&quot;
              <font color="#4E9A06">+</font> ipv6_cidr_block            = &quot;::/0&quot;
              <font color="#4E9A06">+</font> local_gateway_id           = &quot;&quot;
              <font color="#4E9A06">+</font> nat_gateway_id             = &quot;&quot;
              <font color="#4E9A06">+</font> network_interface_id       = &quot;&quot;
              <font color="#4E9A06">+</font> transit_gateway_id         = &quot;&quot;
              <font color="#4E9A06">+</font> vpc_endpoint_id            = &quot;&quot;
              <font color="#4E9A06">+</font> vpc_peering_connection_id  = &quot;&quot;
            },
          <font color="#4E9A06">+</font> {
              <font color="#4E9A06">+</font> carrier_gateway_id         = &quot;&quot;
              <font color="#4E9A06">+</font> cidr_block                 = &quot;0.0.0.0/0&quot;
              <font color="#4E9A06">+</font> destination_prefix_list_id = &quot;&quot;
              <font color="#4E9A06">+</font> egress_only_gateway_id     = &quot;&quot;
              <font color="#4E9A06">+</font> gateway_id                 = (known after apply)
              <font color="#4E9A06">+</font> instance_id                = &quot;&quot;
              <font color="#4E9A06">+</font> ipv6_cidr_block            = &quot;&quot;
              <font color="#4E9A06">+</font> local_gateway_id           = &quot;&quot;
              <font color="#4E9A06">+</font> nat_gateway_id             = &quot;&quot;
              <font color="#4E9A06">+</font> network_interface_id       = &quot;&quot;
              <font color="#4E9A06">+</font> transit_gateway_id         = &quot;&quot;
              <font color="#4E9A06">+</font> vpc_endpoint_id            = &quot;&quot;
              <font color="#4E9A06">+</font> vpc_peering_connection_id  = &quot;&quot;
            },
        ]
      <font color="#4E9A06">+</font> tags             = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_public_rt&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tags_all         = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_public_rt&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> vpc_id           = (known after apply)
    }

<b>  # aws_route_table_association.nginx_public_1_rt_a</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_route_table_association&quot; &quot;nginx_public_1_rt_a&quot; {
      <font color="#4E9A06">+</font> id             = (known after apply)
      <font color="#4E9A06">+</font> route_table_id = (known after apply)
      <font color="#4E9A06">+</font> subnet_id      = (known after apply)
    }

<b>  # aws_security_group.mysql_sg</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_security_group&quot; &quot;mysql_sg&quot; {
      <font color="#4E9A06">+</font> arn                    = (known after apply)
      <font color="#4E9A06">+</font> description            = &quot;Managed by Terraform&quot;
      <font color="#4E9A06">+</font> egress                 = [
          <font color="#4E9A06">+</font> {
              <font color="#4E9A06">+</font> cidr_blocks      = [
                  <font color="#4E9A06">+</font> &quot;0.0.0.0/0&quot;,
                ]
              <font color="#4E9A06">+</font> description      = &quot;&quot;
              <font color="#4E9A06">+</font> from_port        = 0
              <font color="#4E9A06">+</font> ipv6_cidr_blocks = []
              <font color="#4E9A06">+</font> prefix_list_ids  = []
              <font color="#4E9A06">+</font> protocol         = &quot;-1&quot;
              <font color="#4E9A06">+</font> security_groups  = []
              <font color="#4E9A06">+</font> self             = false
              <font color="#4E9A06">+</font> to_port          = 0
            },
        ]
      <font color="#4E9A06">+</font> id                     = (known after apply)
      <font color="#4E9A06">+</font> ingress                = [
          <font color="#4E9A06">+</font> {
              <font color="#4E9A06">+</font> cidr_blocks      = []
              <font color="#4E9A06">+</font> description      = &quot;&quot;
              <font color="#4E9A06">+</font> from_port        = 3306
              <font color="#4E9A06">+</font> ipv6_cidr_blocks = []
              <font color="#4E9A06">+</font> prefix_list_ids  = []
              <font color="#4E9A06">+</font> protocol         = &quot;tcp&quot;
              <font color="#4E9A06">+</font> security_groups  = (known after apply)
              <font color="#4E9A06">+</font> self             = false
              <font color="#4E9A06">+</font> to_port          = 3306
            },
        ]
      <font color="#4E9A06">+</font> name                   = &quot;mysql_security_group&quot;
      <font color="#4E9A06">+</font> name_prefix            = (known after apply)
      <font color="#4E9A06">+</font> owner_id               = (known after apply)
      <font color="#4E9A06">+</font> revoke_rules_on_delete = false
      <font color="#4E9A06">+</font> tags                   = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;mysql_security_group&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tags_all               = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;mysql_security_group&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> vpc_id                 = (known after apply)
    }

<b>  # aws_security_group.nginx_sg</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_security_group&quot; &quot;nginx_sg&quot; {
      <font color="#4E9A06">+</font> arn                    = (known after apply)
      <font color="#4E9A06">+</font> description            = &quot;Managed by Terraform&quot;
      <font color="#4E9A06">+</font> egress                 = [
          <font color="#4E9A06">+</font> {
              <font color="#4E9A06">+</font> cidr_blocks      = [
                  <font color="#4E9A06">+</font> &quot;0.0.0.0/0&quot;,
                ]
              <font color="#4E9A06">+</font> description      = &quot;&quot;
              <font color="#4E9A06">+</font> from_port        = 0
              <font color="#4E9A06">+</font> ipv6_cidr_blocks = []
              <font color="#4E9A06">+</font> prefix_list_ids  = []
              <font color="#4E9A06">+</font> protocol         = &quot;-1&quot;
              <font color="#4E9A06">+</font> security_groups  = []
              <font color="#4E9A06">+</font> self             = false
              <font color="#4E9A06">+</font> to_port          = 0
            },
        ]
      <font color="#4E9A06">+</font> id                     = (known after apply)
      <font color="#4E9A06">+</font> ingress                = [
          <font color="#4E9A06">+</font> {
              <font color="#4E9A06">+</font> cidr_blocks      = [
                  <font color="#4E9A06">+</font> &quot;0.0.0.0/0&quot;,
                ]
              <font color="#4E9A06">+</font> description      = &quot;&quot;
              <font color="#4E9A06">+</font> from_port        = 22
              <font color="#4E9A06">+</font> ipv6_cidr_blocks = []
              <font color="#4E9A06">+</font> prefix_list_ids  = []
              <font color="#4E9A06">+</font> protocol         = &quot;tcp&quot;
              <font color="#4E9A06">+</font> security_groups  = []
              <font color="#4E9A06">+</font> self             = false
              <font color="#4E9A06">+</font> to_port          = 22
            },
          <font color="#4E9A06">+</font> {
              <font color="#4E9A06">+</font> cidr_blocks      = [
                  <font color="#4E9A06">+</font> &quot;0.0.0.0/0&quot;,
                ]
              <font color="#4E9A06">+</font> description      = &quot;&quot;
              <font color="#4E9A06">+</font> from_port        = 80
              <font color="#4E9A06">+</font> ipv6_cidr_blocks = []
              <font color="#4E9A06">+</font> prefix_list_ids  = []
              <font color="#4E9A06">+</font> protocol         = &quot;tcp&quot;
              <font color="#4E9A06">+</font> security_groups  = []
              <font color="#4E9A06">+</font> self             = false
              <font color="#4E9A06">+</font> to_port          = 80
            },
        ]
      <font color="#4E9A06">+</font> name                   = &quot;HTTP and SSH&quot;
      <font color="#4E9A06">+</font> name_prefix            = (known after apply)
      <font color="#4E9A06">+</font> owner_id               = (known after apply)
      <font color="#4E9A06">+</font> revoke_rules_on_delete = false
      <font color="#4E9A06">+</font> tags                   = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_security_group&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tags_all               = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_security_group&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> vpc_id                 = (known after apply)
    }

<b>  # aws_subnet.nginx_private_subnet[0]</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_subnet&quot; &quot;nginx_private_subnet&quot; {
      <font color="#4E9A06">+</font> arn                                            = (known after apply)
      <font color="#4E9A06">+</font> assign_ipv6_address_on_creation                = false
      <font color="#4E9A06">+</font> availability_zone                              = &quot;eu-central-1a&quot;
      <font color="#4E9A06">+</font> availability_zone_id                           = (known after apply)
      <font color="#4E9A06">+</font> cidr_block                                     = &quot;10.0.3.0/24&quot;
      <font color="#4E9A06">+</font> enable_dns64                                   = false
      <font color="#4E9A06">+</font> enable_resource_name_dns_a_record_on_launch    = false
      <font color="#4E9A06">+</font> enable_resource_name_dns_aaaa_record_on_launch = false
      <font color="#4E9A06">+</font> id                                             = (known after apply)
      <font color="#4E9A06">+</font> ipv6_cidr_block_association_id                 = (known after apply)
      <font color="#4E9A06">+</font> ipv6_native                                    = false
      <font color="#4E9A06">+</font> map_public_ip_on_launch                        = false
      <font color="#4E9A06">+</font> owner_id                                       = (known after apply)
      <font color="#4E9A06">+</font> private_dns_hostname_type_on_launch            = (known after apply)
      <font color="#4E9A06">+</font> tags                                           = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_private_subnet-eu-central-1a&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tags_all                                       = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_private_subnet-eu-central-1a&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> vpc_id                                         = (known after apply)
    }

<b>  # aws_subnet.nginx_private_subnet[1]</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_subnet&quot; &quot;nginx_private_subnet&quot; {
      <font color="#4E9A06">+</font> arn                                            = (known after apply)
      <font color="#4E9A06">+</font> assign_ipv6_address_on_creation                = false
      <font color="#4E9A06">+</font> availability_zone                              = &quot;eu-central-1b&quot;
      <font color="#4E9A06">+</font> availability_zone_id                           = (known after apply)
      <font color="#4E9A06">+</font> cidr_block                                     = &quot;10.0.4.0/24&quot;
      <font color="#4E9A06">+</font> enable_dns64                                   = false
      <font color="#4E9A06">+</font> enable_resource_name_dns_a_record_on_launch    = false
      <font color="#4E9A06">+</font> enable_resource_name_dns_aaaa_record_on_launch = false
      <font color="#4E9A06">+</font> id                                             = (known after apply)
      <font color="#4E9A06">+</font> ipv6_cidr_block_association_id                 = (known after apply)
      <font color="#4E9A06">+</font> ipv6_native                                    = false
      <font color="#4E9A06">+</font> map_public_ip_on_launch                        = false
      <font color="#4E9A06">+</font> owner_id                                       = (known after apply)
      <font color="#4E9A06">+</font> private_dns_hostname_type_on_launch            = (known after apply)
      <font color="#4E9A06">+</font> tags                                           = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_private_subnet-eu-central-1b&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tags_all                                       = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_private_subnet-eu-central-1b&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> vpc_id                                         = (known after apply)
    }

<b>  # aws_subnet.nginx_private_subnet[2]</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_subnet&quot; &quot;nginx_private_subnet&quot; {
      <font color="#4E9A06">+</font> arn                                            = (known after apply)
      <font color="#4E9A06">+</font> assign_ipv6_address_on_creation                = false
      <font color="#4E9A06">+</font> availability_zone                              = &quot;eu-central-1c&quot;
      <font color="#4E9A06">+</font> availability_zone_id                           = (known after apply)
      <font color="#4E9A06">+</font> cidr_block                                     = &quot;10.0.5.0/24&quot;
      <font color="#4E9A06">+</font> enable_dns64                                   = false
      <font color="#4E9A06">+</font> enable_resource_name_dns_a_record_on_launch    = false
      <font color="#4E9A06">+</font> enable_resource_name_dns_aaaa_record_on_launch = false
      <font color="#4E9A06">+</font> id                                             = (known after apply)
      <font color="#4E9A06">+</font> ipv6_cidr_block_association_id                 = (known after apply)
      <font color="#4E9A06">+</font> ipv6_native                                    = false
      <font color="#4E9A06">+</font> map_public_ip_on_launch                        = false
      <font color="#4E9A06">+</font> owner_id                                       = (known after apply)
      <font color="#4E9A06">+</font> private_dns_hostname_type_on_launch            = (known after apply)
      <font color="#4E9A06">+</font> tags                                           = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_private_subnet-eu-central-1c&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tags_all                                       = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_private_subnet-eu-central-1c&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> vpc_id                                         = (known after apply)
    }

<b>  # aws_subnet.nginx_public_subnet[0]</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_subnet&quot; &quot;nginx_public_subnet&quot; {
      <font color="#4E9A06">+</font> arn                                            = (known after apply)
      <font color="#4E9A06">+</font> assign_ipv6_address_on_creation                = false
      <font color="#4E9A06">+</font> availability_zone                              = &quot;eu-central-1a&quot;
      <font color="#4E9A06">+</font> availability_zone_id                           = (known after apply)
      <font color="#4E9A06">+</font> cidr_block                                     = &quot;10.0.0.0/24&quot;
      <font color="#4E9A06">+</font> enable_dns64                                   = false
      <font color="#4E9A06">+</font> enable_resource_name_dns_a_record_on_launch    = false
      <font color="#4E9A06">+</font> enable_resource_name_dns_aaaa_record_on_launch = false
      <font color="#4E9A06">+</font> id                                             = (known after apply)
      <font color="#4E9A06">+</font> ipv6_cidr_block_association_id                 = (known after apply)
      <font color="#4E9A06">+</font> ipv6_native                                    = false
      <font color="#4E9A06">+</font> map_public_ip_on_launch                        = true
      <font color="#4E9A06">+</font> owner_id                                       = (known after apply)
      <font color="#4E9A06">+</font> private_dns_hostname_type_on_launch            = (known after apply)
      <font color="#4E9A06">+</font> tags                                           = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_public_subnet-eu-central-1a&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tags_all                                       = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_public_subnet-eu-central-1a&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> vpc_id                                         = (known after apply)
    }

<b>  # aws_subnet.nginx_public_subnet[1]</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_subnet&quot; &quot;nginx_public_subnet&quot; {
      <font color="#4E9A06">+</font> arn                                            = (known after apply)
      <font color="#4E9A06">+</font> assign_ipv6_address_on_creation                = false
      <font color="#4E9A06">+</font> availability_zone                              = &quot;eu-central-1b&quot;
      <font color="#4E9A06">+</font> availability_zone_id                           = (known after apply)
      <font color="#4E9A06">+</font> cidr_block                                     = &quot;10.0.1.0/24&quot;
      <font color="#4E9A06">+</font> enable_dns64                                   = false
      <font color="#4E9A06">+</font> enable_resource_name_dns_a_record_on_launch    = false
      <font color="#4E9A06">+</font> enable_resource_name_dns_aaaa_record_on_launch = false
      <font color="#4E9A06">+</font> id                                             = (known after apply)
      <font color="#4E9A06">+</font> ipv6_cidr_block_association_id                 = (known after apply)
      <font color="#4E9A06">+</font> ipv6_native                                    = false
      <font color="#4E9A06">+</font> map_public_ip_on_launch                        = true
      <font color="#4E9A06">+</font> owner_id                                       = (known after apply)
      <font color="#4E9A06">+</font> private_dns_hostname_type_on_launch            = (known after apply)
      <font color="#4E9A06">+</font> tags                                           = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_public_subnet-eu-central-1b&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tags_all                                       = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_public_subnet-eu-central-1b&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> vpc_id                                         = (known after apply)
    }

<b>  # aws_subnet.nginx_public_subnet[2]</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_subnet&quot; &quot;nginx_public_subnet&quot; {
      <font color="#4E9A06">+</font> arn                                            = (known after apply)
      <font color="#4E9A06">+</font> assign_ipv6_address_on_creation                = false
      <font color="#4E9A06">+</font> availability_zone                              = &quot;eu-central-1c&quot;
      <font color="#4E9A06">+</font> availability_zone_id                           = (known after apply)
      <font color="#4E9A06">+</font> cidr_block                                     = &quot;10.0.2.0/24&quot;
      <font color="#4E9A06">+</font> enable_dns64                                   = false
      <font color="#4E9A06">+</font> enable_resource_name_dns_a_record_on_launch    = false
      <font color="#4E9A06">+</font> enable_resource_name_dns_aaaa_record_on_launch = false
      <font color="#4E9A06">+</font> id                                             = (known after apply)
      <font color="#4E9A06">+</font> ipv6_cidr_block_association_id                 = (known after apply)
      <font color="#4E9A06">+</font> ipv6_native                                    = false
      <font color="#4E9A06">+</font> map_public_ip_on_launch                        = true
      <font color="#4E9A06">+</font> owner_id                                       = (known after apply)
      <font color="#4E9A06">+</font> private_dns_hostname_type_on_launch            = (known after apply)
      <font color="#4E9A06">+</font> tags                                           = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_public_subnet-eu-central-1c&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tags_all                                       = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_public_subnet-eu-central-1c&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> vpc_id                                         = (known after apply)
    }

<b>  # aws_vpc.nginx_test_vpc</b> will be created
  <font color="#4E9A06">+</font> resource &quot;aws_vpc&quot; &quot;nginx_test_vpc&quot; {
      <font color="#4E9A06">+</font> arn                                  = (known after apply)
      <font color="#4E9A06">+</font> cidr_block                           = &quot;10.0.0.0/16&quot;
      <font color="#4E9A06">+</font> default_network_acl_id               = (known after apply)
      <font color="#4E9A06">+</font> default_route_table_id               = (known after apply)
      <font color="#4E9A06">+</font> default_security_group_id            = (known after apply)
      <font color="#4E9A06">+</font> dhcp_options_id                      = (known after apply)
      <font color="#4E9A06">+</font> enable_classiclink                   = (known after apply)
      <font color="#4E9A06">+</font> enable_classiclink_dns_support       = (known after apply)
      <font color="#4E9A06">+</font> enable_dns_hostnames                 = (known after apply)
      <font color="#4E9A06">+</font> enable_dns_support                   = true
      <font color="#4E9A06">+</font> id                                   = (known after apply)
      <font color="#4E9A06">+</font> instance_tenancy                     = &quot;default&quot;
      <font color="#4E9A06">+</font> ipv6_association_id                  = (known after apply)
      <font color="#4E9A06">+</font> ipv6_cidr_block                      = (known after apply)
      <font color="#4E9A06">+</font> ipv6_cidr_block_network_border_group = (known after apply)
      <font color="#4E9A06">+</font> main_route_table_id                  = (known after apply)
      <font color="#4E9A06">+</font> owner_id                             = (known after apply)
      <font color="#4E9A06">+</font> tags                                 = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_test_vpc&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
      <font color="#4E9A06">+</font> tags_all                             = {
          <font color="#4E9A06">+</font> &quot;Name&quot;        = &quot;nginx_test_vpc&quot;
          <font color="#4E9A06">+</font> &quot;environment&quot; = &quot;dev&quot;
        }
    }

<b>Plan:</b> 15 to add, 0 to change, 0 to destroy.

<b>Do you want to perform these actions?</b>
  Terraform will perform the actions described above.
  Only &apos;yes&apos; will be accepted to approve.

  <b>Enter a value:</b> yes

<b>aws_vpc.nginx_test_vpc: Creating...</b>
<b>aws_vpc.nginx_test_vpc: Creation complete after 5s [id=vpc-0ac2c005e5cdb5684]</b>
<b>aws_internet_gateway.nginx_igw: Creating...</b>
<b>aws_subnet.nginx_public_subnet[0]: Creating...</b>
<b>aws_subnet.nginx_public_subnet[1]: Creating...</b>
<b>aws_subnet.nginx_public_subnet[2]: Creating...</b>
<b>aws_subnet.nginx_private_subnet[2]: Creating...</b>
<b>aws_subnet.nginx_private_subnet[1]: Creating...</b>
<b>aws_subnet.nginx_private_subnet[0]: Creating...</b>
<b>aws_security_group.nginx_sg: Creating...</b>
<b>aws_subnet.nginx_private_subnet[1]: Creation complete after 2s [id=subnet-084713edb23129f23]</b>
<b>aws_subnet.nginx_private_subnet[0]: Creation complete after 2s [id=subnet-0f535eab7e2b1f0ce]</b>
<b>aws_subnet.nginx_private_subnet[2]: Creation complete after 2s [id=subnet-01cd877c27caea4dc]</b>
<b>aws_internet_gateway.nginx_igw: Creation complete after 2s [id=igw-02c4136f6146124bc]</b>
<b>aws_db_subnet_group.nginx_db_subnet: Creating...</b>
<b>aws_route_table.nginx_public_rt: Creating...</b>
<b>aws_db_subnet_group.nginx_db_subnet: Creation complete after 2s [id=terraform-mysql-subnet-group]</b>
<b>aws_security_group.nginx_sg: Creation complete after 6s [id=sg-092bb82959bcba6c3]</b>
<b>aws_security_group.mysql_sg: Creating...</b>
<b>aws_db_instance.default: Creating...</b>
<b>aws_route_table.nginx_public_rt: Creation complete after 5s [id=rtb-0a09ae20ea1bd544f]</b>
<b>aws_subnet.nginx_public_subnet[0]: Still creating... [10s elapsed]</b>
<b>aws_subnet.nginx_public_subnet[1]: Still creating... [10s elapsed]</b>
<b>aws_subnet.nginx_public_subnet[2]: Still creating... [10s elapsed]</b>
<b>aws_security_group.mysql_sg: Creation complete after 6s [id=sg-0e73c059bd97db07f]</b>
<b>aws_subnet.nginx_public_subnet[2]: Creation complete after 13s [id=subnet-09948f06db975c8d0]</b>
<b>aws_subnet.nginx_public_subnet[0]: Creation complete after 13s [id=subnet-0a989169acca21f8e]</b>
<b>aws_subnet.nginx_public_subnet[1]: Creation complete after 13s [id=subnet-0ed124df96bd8b700]</b>
<b>aws_route_table_association.nginx_public_1_rt_a: Creating...</b>
<b>aws_instance.nginx_server: Creating...</b>
<b>aws_route_table_association.nginx_public_1_rt_a: Creation complete after 2s [id=rtbassoc-09ed81c883c775c9a]</b>
<b>aws_db_instance.default: Still creating... [10s elapsed]</b>
<b>aws_instance.nginx_server: Still creating... [10s elapsed]</b>
<b>aws_db_instance.default: Still creating... [20s elapsed]</b>
<b>aws_instance.nginx_server: Still creating... [20s elapsed]</b>
<b>aws_db_instance.default: Still creating... [30s elapsed]</b>
<b>aws_instance.nginx_server: Still creating... [30s elapsed]</b>
<b>aws_db_instance.default: Still creating... [40s elapsed]</b>
<b>aws_instance.nginx_server: Creation complete after 37s [id=i-0d70ce3a567a34401]</b>
<b>aws_db_instance.default: Still creating... [50s elapsed]</b>
<b>aws_db_instance.default: Still creating... [1m0s elapsed]</b>
<b>aws_db_instance.default: Still creating... [1m10s elapsed]</b>
<b>aws_db_instance.default: Still creating... [1m20s elapsed]</b>
<b>aws_db_instance.default: Still creating... [1m30s elapsed]</b>
<b>aws_db_instance.default: Still creating... [1m40s elapsed]</b>
<b>aws_db_instance.default: Still creating... [1m50s elapsed]</b>
<b>aws_db_instance.default: Still creating... [2m0s elapsed]</b>
<b>aws_db_instance.default: Still creating... [2m10s elapsed]</b>
<b>aws_db_instance.default: Still creating... [2m20s elapsed]</b>
<b>aws_db_instance.default: Still creating... [2m30s elapsed]</b>
<b>aws_db_instance.default: Still creating... [2m40s elapsed]</b>
<b>aws_db_instance.default: Still creating... [2m50s elapsed]</b>
<b>aws_db_instance.default: Still creating... [3m0s elapsed]</b>
<b>aws_db_instance.default: Still creating... [3m10s elapsed]</b>
<b>aws_db_instance.default: Still creating... [3m20s elapsed]</b>
<b>aws_db_instance.default: Still creating... [3m30s elapsed]</b>
<b>aws_db_instance.default: Still creating... [3m40s elapsed]</b>
<b>aws_db_instance.default: Still creating... [3m50s elapsed]</b>
<b>aws_db_instance.default: Still creating... [4m0s elapsed]</b>
<b>aws_db_instance.default: Creation complete after 4m5s [id=terraform-mysql]</b>

<font color="#8AE234"><b>Apply complete! Resources: 15 added, 0 changed, 0 destroyed.</b></font>

┌─[ 4:47][][<font color="#4E9A06">alexLaptop</font>][<font color="#8AE234"><b>±</b></font>][main ?:1 <font color="#EF2929"><b>✗</b></font>]
├─[<font color="#06989A">~/_GIT/github/EPAM/devops-school-terraform/Task2</font>]
└─▪ 
</pre>

Tadaaaa! A EC2 and a MySQL DB instances up and running.

Okay then. Let's delete all the stuff.

<pre>┌─[ 4:54][][<font color="#4E9A06">alexLaptop</font>][<font color="#8AE234"><b>±</b></font>][main ?:1 <font color="#EF2929"><b>✗</b></font>]
├─[<font color="#06989A">~/_GIT/github/EPAM/devops-school-terraform/Task2</font>]
└─▪ terraform destroy
<b>aws_vpc.nginx_test_vpc: Refreshing state... [id=vpc-0ac2c005e5cdb5684]</b>
<b>aws_internet_gateway.nginx_igw: Refreshing state... [id=igw-02c4136f6146124bc]</b>
<b>aws_subnet.nginx_private_subnet[0]: Refreshing state... [id=subnet-0f535eab7e2b1f0ce]</b>
<b>aws_subnet.nginx_public_subnet[0]: Refreshing state... [id=subnet-0a989169acca21f8e]</b>
<b>aws_subnet.nginx_private_subnet[2]: Refreshing state... [id=subnet-01cd877c27caea4dc]</b>
<b>aws_subnet.nginx_public_subnet[1]: Refreshing state... [id=subnet-0ed124df96bd8b700]</b>
<b>aws_subnet.nginx_private_subnet[1]: Refreshing state... [id=subnet-084713edb23129f23]</b>
<b>aws_subnet.nginx_public_subnet[2]: Refreshing state... [id=subnet-09948f06db975c8d0]</b>
<b>aws_security_group.nginx_sg: Refreshing state... [id=sg-092bb82959bcba6c3]</b>
<b>aws_route_table.nginx_public_rt: Refreshing state... [id=rtb-0a09ae20ea1bd544f]</b>
<b>aws_db_subnet_group.nginx_db_subnet: Refreshing state... [id=terraform-mysql-subnet-group]</b>
<b>aws_security_group.mysql_sg: Refreshing state... [id=sg-0e73c059bd97db07f]</b>
<b>aws_instance.nginx_server: Refreshing state... [id=i-0d70ce3a567a34401]</b>
<b>aws_route_table_association.nginx_public_1_rt_a: Refreshing state... [id=rtbassoc-09ed81c883c775c9a]</b>
<b>aws_db_instance.default: Refreshing state... [id=terraform-mysql]</b>

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
the following symbols:
  <font color="#CC0000">-</font> destroy

Terraform will perform the following actions:

<b>  # aws_db_instance.default</b> will be <font color="#EF2929"><b>destroyed</b></font>
  <font color="#CC0000">-</font> resource &quot;aws_db_instance&quot; &quot;default&quot; {
      <font color="#CC0000">-</font> address                               = &quot;terraform-mysql.cmjnksf1yqx3.eu-central-1.rds.amazonaws.com&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> allocated_storage                     = 5 <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> arn                                   = &quot;arn:aws:rds:eu-central-1:829613558099:db:terraform-mysql&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> auto_minor_version_upgrade            = true <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> availability_zone                     = &quot;eu-central-1b&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> backup_retention_period               = 0 <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> backup_window                         = &quot;21:46-22:16&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> ca_cert_identifier                    = &quot;rds-ca-2019&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> copy_tags_to_snapshot                 = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> customer_owned_ip_enabled             = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> db_subnet_group_name                  = &quot;terraform-mysql-subnet-group&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> delete_automated_backups              = true <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> deletion_protection                   = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> enabled_cloudwatch_logs_exports       = [] <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> endpoint                              = &quot;terraform-mysql.cmjnksf1yqx3.eu-central-1.rds.amazonaws.com:3306&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> engine                                = &quot;mysql&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> engine_version                        = &quot;8.0.27&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> engine_version_actual                 = &quot;8.0.27&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> final_snapshot_identifier             = &quot;Ignore&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> hosted_zone_id                        = &quot;Z1RLNUO7B9Q6NB&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> iam_database_authentication_enabled   = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> id                                    = &quot;terraform-mysql&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> identifier                            = &quot;terraform-mysql&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> instance_class                        = &quot;db.t2.micro&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> iops                                  = 0 <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> latest_restorable_time                = &quot;0001-01-01T00:00:00Z&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> license_model                         = &quot;general-public-license&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> maintenance_window                    = &quot;fri:01:28-fri:01:58&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> max_allocated_storage                 = 0 <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> monitoring_interval                   = 0 <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> multi_az                              = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> name                                  = &quot;terraform_test_db&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> option_group_name                     = &quot;default:mysql-8-0&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> parameter_group_name                  = &quot;default.mysql8.0&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> password                              = (sensitive value)
      <font color="#CC0000">-</font> performance_insights_enabled          = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> performance_insights_retention_period = 0 <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> port                                  = 3306 <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> publicly_accessible                   = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> replicas                              = [] <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> resource_id                           = &quot;db-YAASTDJMHC35JRXKJ7V6VCD3EM&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> security_group_names                  = [] <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> skip_final_snapshot                   = true <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> status                                = &quot;available&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> storage_encrypted                     = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> storage_type                          = &quot;gp2&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags                                  = {} <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags_all                              = {} <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> username                              = &quot;terraform&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> vpc_security_group_ids                = [
          <font color="#CC0000">-</font> &quot;sg-092bb82959bcba6c3&quot;,
        ] <font color="#555753">-&gt;</font> <font color="#555753">null</font>
    }

<b>  # aws_db_subnet_group.nginx_db_subnet</b> will be <font color="#EF2929"><b>destroyed</b></font>
  <font color="#CC0000">-</font> resource &quot;aws_db_subnet_group&quot; &quot;nginx_db_subnet&quot; {
      <font color="#CC0000">-</font> arn         = &quot;arn:aws:rds:eu-central-1:829613558099:subgrp:terraform-mysql-subnet-group&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> description = &quot;Terraform RDS subnet group&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> id          = &quot;terraform-mysql-subnet-group&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> name        = &quot;terraform-mysql-subnet-group&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> subnet_ids  = [
          <font color="#CC0000">-</font> &quot;subnet-01cd877c27caea4dc&quot;,
          <font color="#CC0000">-</font> &quot;subnet-084713edb23129f23&quot;,
          <font color="#CC0000">-</font> &quot;subnet-0f535eab7e2b1f0ce&quot;,
        ] <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags        = {} <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags_all    = {} <font color="#555753">-&gt;</font> <font color="#555753">null</font>
    }

<b>  # aws_instance.nginx_server</b> will be <font color="#EF2929"><b>destroyed</b></font>
  <font color="#CC0000">-</font> resource &quot;aws_instance&quot; &quot;nginx_server&quot; {
      <font color="#CC0000">-</font> ami                                  = &quot;ami-0eb7496c2e0403237&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> arn                                  = &quot;arn:aws:ec2:eu-central-1:829613558099:instance/i-0d70ce3a567a34401&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> associate_public_ip_address          = true <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> availability_zone                    = &quot;eu-central-1a&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> cpu_core_count                       = 1 <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> cpu_threads_per_core                 = 1 <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> disable_api_termination              = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> ebs_optimized                        = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> get_password_data                    = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> hibernation                          = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> id                                   = &quot;i-0d70ce3a567a34401&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> instance_initiated_shutdown_behavior = &quot;stop&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> instance_state                       = &quot;running&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> instance_type                        = &quot;t2.micro&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> ipv6_address_count                   = 0 <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> ipv6_addresses                       = [] <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> monitoring                           = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> primary_network_interface_id         = &quot;eni-0e0c62404504ec96a&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> private_dns                          = &quot;ip-10-0-0-41.eu-central-1.compute.internal&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> private_ip                           = &quot;10.0.0.41&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> public_ip                            = &quot;3.70.204.117&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> secondary_private_ips                = [] <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> security_groups                      = [] <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> source_dest_check                    = true <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> subnet_id                            = &quot;subnet-0a989169acca21f8e&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags                                 = {
          <font color="#CC0000">-</font> &quot;Name&quot;        = &quot;nginx_server&quot;
          <font color="#CC0000">-</font> &quot;environment&quot; = &quot;dev&quot;
        } <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags_all                             = {
          <font color="#CC0000">-</font> &quot;Name&quot;        = &quot;nginx_server&quot;
          <font color="#CC0000">-</font> &quot;environment&quot; = &quot;dev&quot;
        } <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tenancy                              = &quot;default&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> user_data                            = &quot;64779120b06e8649f85b3914ce7d0e6343f2fff4&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> vpc_security_group_ids               = [
          <font color="#CC0000">-</font> &quot;sg-092bb82959bcba6c3&quot;,
        ] <font color="#555753">-&gt;</font> <font color="#555753">null</font>

      <font color="#CC0000">-</font> capacity_reservation_specification {
          <font color="#CC0000">-</font> capacity_reservation_preference = &quot;open&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
        }

      <font color="#CC0000">-</font> credit_specification {
          <font color="#CC0000">-</font> cpu_credits = &quot;standard&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
        }

      <font color="#CC0000">-</font> enclave_options {
          <font color="#CC0000">-</font> enabled = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
        }

      <font color="#CC0000">-</font> metadata_options {
          <font color="#CC0000">-</font> http_endpoint               = &quot;enabled&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
          <font color="#CC0000">-</font> http_put_response_hop_limit = 1 <font color="#555753">-&gt;</font> <font color="#555753">null</font>
          <font color="#CC0000">-</font> http_tokens                 = &quot;optional&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
          <font color="#CC0000">-</font> instance_metadata_tags      = &quot;disabled&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
        }

      <font color="#CC0000">-</font> root_block_device {
          <font color="#CC0000">-</font> delete_on_termination = true <font color="#555753">-&gt;</font> <font color="#555753">null</font>
          <font color="#CC0000">-</font> device_name           = &quot;/dev/xvda&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
          <font color="#CC0000">-</font> encrypted             = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
          <font color="#CC0000">-</font> iops                  = 100 <font color="#555753">-&gt;</font> <font color="#555753">null</font>
          <font color="#CC0000">-</font> tags                  = {} <font color="#555753">-&gt;</font> <font color="#555753">null</font>
          <font color="#CC0000">-</font> throughput            = 0 <font color="#555753">-&gt;</font> <font color="#555753">null</font>
          <font color="#CC0000">-</font> volume_id             = &quot;vol-0afb8004f4c215773&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
          <font color="#CC0000">-</font> volume_size           = 8 <font color="#555753">-&gt;</font> <font color="#555753">null</font>
          <font color="#CC0000">-</font> volume_type           = &quot;gp2&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
        }
    }

<b>  # aws_internet_gateway.nginx_igw</b> will be <font color="#EF2929"><b>destroyed</b></font>
  <font color="#CC0000">-</font> resource &quot;aws_internet_gateway&quot; &quot;nginx_igw&quot; {
      <font color="#CC0000">-</font> arn      = &quot;arn:aws:ec2:eu-central-1:829613558099:internet-gateway/igw-02c4136f6146124bc&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> id       = &quot;igw-02c4136f6146124bc&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> owner_id = &quot;829613558099&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags     = {
          <font color="#CC0000">-</font> &quot;Name&quot;        = &quot;nginx_internet_gateway&quot;
          <font color="#CC0000">-</font> &quot;environment&quot; = &quot;dev&quot;
        } <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags_all = {
          <font color="#CC0000">-</font> &quot;Name&quot;        = &quot;nginx_internet_gateway&quot;
          <font color="#CC0000">-</font> &quot;environment&quot; = &quot;dev&quot;
        } <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> vpc_id   = &quot;vpc-0ac2c005e5cdb5684&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
    }

<b>  # aws_route_table.nginx_public_rt</b> will be <font color="#EF2929"><b>destroyed</b></font>
  <font color="#CC0000">-</font> resource &quot;aws_route_table&quot; &quot;nginx_public_rt&quot; {
      <font color="#CC0000">-</font> arn              = &quot;arn:aws:ec2:eu-central-1:829613558099:route-table/rtb-0a09ae20ea1bd544f&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> id               = &quot;rtb-0a09ae20ea1bd544f&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> owner_id         = &quot;829613558099&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> propagating_vgws = [] <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> route            = [
          <font color="#CC0000">-</font> {
              <font color="#CC0000">-</font> carrier_gateway_id         = &quot;&quot;
              <font color="#CC0000">-</font> cidr_block                 = &quot;&quot;
              <font color="#CC0000">-</font> destination_prefix_list_id = &quot;&quot;
              <font color="#CC0000">-</font> egress_only_gateway_id     = &quot;&quot;
              <font color="#CC0000">-</font> gateway_id                 = &quot;igw-02c4136f6146124bc&quot;
              <font color="#CC0000">-</font> instance_id                = &quot;&quot;
              <font color="#CC0000">-</font> ipv6_cidr_block            = &quot;::/0&quot;
              <font color="#CC0000">-</font> local_gateway_id           = &quot;&quot;
              <font color="#CC0000">-</font> nat_gateway_id             = &quot;&quot;
              <font color="#CC0000">-</font> network_interface_id       = &quot;&quot;
              <font color="#CC0000">-</font> transit_gateway_id         = &quot;&quot;
              <font color="#CC0000">-</font> vpc_endpoint_id            = &quot;&quot;
              <font color="#CC0000">-</font> vpc_peering_connection_id  = &quot;&quot;
            },
          <font color="#CC0000">-</font> {
              <font color="#CC0000">-</font> carrier_gateway_id         = &quot;&quot;
              <font color="#CC0000">-</font> cidr_block                 = &quot;0.0.0.0/0&quot;
              <font color="#CC0000">-</font> destination_prefix_list_id = &quot;&quot;
              <font color="#CC0000">-</font> egress_only_gateway_id     = &quot;&quot;
              <font color="#CC0000">-</font> gateway_id                 = &quot;igw-02c4136f6146124bc&quot;
              <font color="#CC0000">-</font> instance_id                = &quot;&quot;
              <font color="#CC0000">-</font> ipv6_cidr_block            = &quot;&quot;
              <font color="#CC0000">-</font> local_gateway_id           = &quot;&quot;
              <font color="#CC0000">-</font> nat_gateway_id             = &quot;&quot;
              <font color="#CC0000">-</font> network_interface_id       = &quot;&quot;
              <font color="#CC0000">-</font> transit_gateway_id         = &quot;&quot;
              <font color="#CC0000">-</font> vpc_endpoint_id            = &quot;&quot;
              <font color="#CC0000">-</font> vpc_peering_connection_id  = &quot;&quot;
            },
        ] <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags             = {
          <font color="#CC0000">-</font> &quot;Name&quot;        = &quot;nginx_public_rt&quot;
          <font color="#CC0000">-</font> &quot;environment&quot; = &quot;dev&quot;
        } <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags_all         = {
          <font color="#CC0000">-</font> &quot;Name&quot;        = &quot;nginx_public_rt&quot;
          <font color="#CC0000">-</font> &quot;environment&quot; = &quot;dev&quot;
        } <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> vpc_id           = &quot;vpc-0ac2c005e5cdb5684&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
    }

<b>  # aws_route_table_association.nginx_public_1_rt_a</b> will be <font color="#EF2929"><b>destroyed</b></font>
  <font color="#CC0000">-</font> resource &quot;aws_route_table_association&quot; &quot;nginx_public_1_rt_a&quot; {
      <font color="#CC0000">-</font> id             = &quot;rtbassoc-09ed81c883c775c9a&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> route_table_id = &quot;rtb-0a09ae20ea1bd544f&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> subnet_id      = &quot;subnet-0a989169acca21f8e&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
    }

<b>  # aws_security_group.mysql_sg</b> will be <font color="#EF2929"><b>destroyed</b></font>
  <font color="#CC0000">-</font> resource &quot;aws_security_group&quot; &quot;mysql_sg&quot; {
      <font color="#CC0000">-</font> arn                    = &quot;arn:aws:ec2:eu-central-1:829613558099:security-group/sg-0e73c059bd97db07f&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> description            = &quot;Managed by Terraform&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> egress                 = [
          <font color="#CC0000">-</font> {
              <font color="#CC0000">-</font> cidr_blocks      = [
                  <font color="#CC0000">-</font> &quot;0.0.0.0/0&quot;,
                ]
              <font color="#CC0000">-</font> description      = &quot;&quot;
              <font color="#CC0000">-</font> from_port        = 0
              <font color="#CC0000">-</font> ipv6_cidr_blocks = []
              <font color="#CC0000">-</font> prefix_list_ids  = []
              <font color="#CC0000">-</font> protocol         = &quot;-1&quot;
              <font color="#CC0000">-</font> security_groups  = []
              <font color="#CC0000">-</font> self             = false
              <font color="#CC0000">-</font> to_port          = 0
            },
        ] <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> id                     = &quot;sg-0e73c059bd97db07f&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> ingress                = [
          <font color="#CC0000">-</font> {
              <font color="#CC0000">-</font> cidr_blocks      = []
              <font color="#CC0000">-</font> description      = &quot;&quot;
              <font color="#CC0000">-</font> from_port        = 3306
              <font color="#CC0000">-</font> ipv6_cidr_blocks = []
              <font color="#CC0000">-</font> prefix_list_ids  = []
              <font color="#CC0000">-</font> protocol         = &quot;tcp&quot;
              <font color="#CC0000">-</font> security_groups  = [
                  <font color="#CC0000">-</font> &quot;sg-092bb82959bcba6c3&quot;,
                ]
              <font color="#CC0000">-</font> self             = false
              <font color="#CC0000">-</font> to_port          = 3306
            },
        ] <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> name                   = &quot;mysql_security_group&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> owner_id               = &quot;829613558099&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> revoke_rules_on_delete = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags                   = {
          <font color="#CC0000">-</font> &quot;Name&quot;        = &quot;mysql_security_group&quot;
          <font color="#CC0000">-</font> &quot;environment&quot; = &quot;dev&quot;
        } <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags_all               = {
          <font color="#CC0000">-</font> &quot;Name&quot;        = &quot;mysql_security_group&quot;
          <font color="#CC0000">-</font> &quot;environment&quot; = &quot;dev&quot;
        } <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> vpc_id                 = &quot;vpc-0ac2c005e5cdb5684&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
    }

<b>  # aws_security_group.nginx_sg</b> will be <font color="#EF2929"><b>destroyed</b></font>
  <font color="#CC0000">-</font> resource &quot;aws_security_group&quot; &quot;nginx_sg&quot; {
      <font color="#CC0000">-</font> arn                    = &quot;arn:aws:ec2:eu-central-1:829613558099:security-group/sg-092bb82959bcba6c3&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> description            = &quot;Managed by Terraform&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> egress                 = [
          <font color="#CC0000">-</font> {
              <font color="#CC0000">-</font> cidr_blocks      = [
                  <font color="#CC0000">-</font> &quot;0.0.0.0/0&quot;,
                ]
              <font color="#CC0000">-</font> description      = &quot;&quot;
              <font color="#CC0000">-</font> from_port        = 0
              <font color="#CC0000">-</font> ipv6_cidr_blocks = []
              <font color="#CC0000">-</font> prefix_list_ids  = []
              <font color="#CC0000">-</font> protocol         = &quot;-1&quot;
              <font color="#CC0000">-</font> security_groups  = []
              <font color="#CC0000">-</font> self             = false
              <font color="#CC0000">-</font> to_port          = 0
            },
        ] <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> id                     = &quot;sg-092bb82959bcba6c3&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> ingress                = [
          <font color="#CC0000">-</font> {
              <font color="#CC0000">-</font> cidr_blocks      = [
                  <font color="#CC0000">-</font> &quot;0.0.0.0/0&quot;,
                ]
              <font color="#CC0000">-</font> description      = &quot;&quot;
              <font color="#CC0000">-</font> from_port        = 22
              <font color="#CC0000">-</font> ipv6_cidr_blocks = []
              <font color="#CC0000">-</font> prefix_list_ids  = []
              <font color="#CC0000">-</font> protocol         = &quot;tcp&quot;
              <font color="#CC0000">-</font> security_groups  = []
              <font color="#CC0000">-</font> self             = false
              <font color="#CC0000">-</font> to_port          = 22
            },
          <font color="#CC0000">-</font> {
              <font color="#CC0000">-</font> cidr_blocks      = [
                  <font color="#CC0000">-</font> &quot;0.0.0.0/0&quot;,
                ]
              <font color="#CC0000">-</font> description      = &quot;&quot;
              <font color="#CC0000">-</font> from_port        = 80
              <font color="#CC0000">-</font> ipv6_cidr_blocks = []
              <font color="#CC0000">-</font> prefix_list_ids  = []
              <font color="#CC0000">-</font> protocol         = &quot;tcp&quot;
              <font color="#CC0000">-</font> security_groups  = []
              <font color="#CC0000">-</font> self             = false
              <font color="#CC0000">-</font> to_port          = 80
            },
        ] <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> name                   = &quot;HTTP and SSH&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> owner_id               = &quot;829613558099&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> revoke_rules_on_delete = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags                   = {
          <font color="#CC0000">-</font> &quot;Name&quot;        = &quot;nginx_security_group&quot;
          <font color="#CC0000">-</font> &quot;environment&quot; = &quot;dev&quot;
        } <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags_all               = {
          <font color="#CC0000">-</font> &quot;Name&quot;        = &quot;nginx_security_group&quot;
          <font color="#CC0000">-</font> &quot;environment&quot; = &quot;dev&quot;
        } <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> vpc_id                 = &quot;vpc-0ac2c005e5cdb5684&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
    }

<b>  # aws_subnet.nginx_private_subnet[0]</b> will be <font color="#EF2929"><b>destroyed</b></font>
  <font color="#CC0000">-</font> resource &quot;aws_subnet&quot; &quot;nginx_private_subnet&quot; {
      <font color="#CC0000">-</font> arn                                            = &quot;arn:aws:ec2:eu-central-1:829613558099:subnet/subnet-0f535eab7e2b1f0ce&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> assign_ipv6_address_on_creation                = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> availability_zone                              = &quot;eu-central-1a&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> availability_zone_id                           = &quot;euc1-az2&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> cidr_block                                     = &quot;10.0.3.0/24&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> enable_dns64                                   = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> enable_resource_name_dns_a_record_on_launch    = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> enable_resource_name_dns_aaaa_record_on_launch = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> id                                             = &quot;subnet-0f535eab7e2b1f0ce&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> ipv6_native                                    = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> map_customer_owned_ip_on_launch                = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> map_public_ip_on_launch                        = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> owner_id                                       = &quot;829613558099&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> private_dns_hostname_type_on_launch            = &quot;ip-name&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags                                           = {
          <font color="#CC0000">-</font> &quot;Name&quot;        = &quot;nginx_private_subnet-eu-central-1a&quot;
          <font color="#CC0000">-</font> &quot;environment&quot; = &quot;dev&quot;
        } <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags_all                                       = {
          <font color="#CC0000">-</font> &quot;Name&quot;        = &quot;nginx_private_subnet-eu-central-1a&quot;
          <font color="#CC0000">-</font> &quot;environment&quot; = &quot;dev&quot;
        } <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> vpc_id                                         = &quot;vpc-0ac2c005e5cdb5684&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
    }

<b>  # aws_subnet.nginx_private_subnet[1]</b> will be <font color="#EF2929"><b>destroyed</b></font>
  <font color="#CC0000">-</font> resource &quot;aws_subnet&quot; &quot;nginx_private_subnet&quot; {
      <font color="#CC0000">-</font> arn                                            = &quot;arn:aws:ec2:eu-central-1:829613558099:subnet/subnet-084713edb23129f23&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> assign_ipv6_address_on_creation                = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> availability_zone                              = &quot;eu-central-1b&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> availability_zone_id                           = &quot;euc1-az3&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> cidr_block                                     = &quot;10.0.4.0/24&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> enable_dns64                                   = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> enable_resource_name_dns_a_record_on_launch    = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> enable_resource_name_dns_aaaa_record_on_launch = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> id                                             = &quot;subnet-084713edb23129f23&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> ipv6_native                                    = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> map_customer_owned_ip_on_launch                = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> map_public_ip_on_launch                        = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> owner_id                                       = &quot;829613558099&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> private_dns_hostname_type_on_launch            = &quot;ip-name&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags                                           = {
          <font color="#CC0000">-</font> &quot;Name&quot;        = &quot;nginx_private_subnet-eu-central-1b&quot;
          <font color="#CC0000">-</font> &quot;environment&quot; = &quot;dev&quot;
        } <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags_all                                       = {
          <font color="#CC0000">-</font> &quot;Name&quot;        = &quot;nginx_private_subnet-eu-central-1b&quot;
          <font color="#CC0000">-</font> &quot;environment&quot; = &quot;dev&quot;
        } <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> vpc_id                                         = &quot;vpc-0ac2c005e5cdb5684&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
    }

<b>  # aws_subnet.nginx_private_subnet[2]</b> will be <font color="#EF2929"><b>destroyed</b></font>
  <font color="#CC0000">-</font> resource &quot;aws_subnet&quot; &quot;nginx_private_subnet&quot; {
      <font color="#CC0000">-</font> arn                                            = &quot;arn:aws:ec2:eu-central-1:829613558099:subnet/subnet-01cd877c27caea4dc&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> assign_ipv6_address_on_creation                = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> availability_zone                              = &quot;eu-central-1c&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> availability_zone_id                           = &quot;euc1-az1&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> cidr_block                                     = &quot;10.0.5.0/24&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> enable_dns64                                   = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> enable_resource_name_dns_a_record_on_launch    = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> enable_resource_name_dns_aaaa_record_on_launch = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> id                                             = &quot;subnet-01cd877c27caea4dc&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> ipv6_native                                    = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> map_customer_owned_ip_on_launch                = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> map_public_ip_on_launch                        = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> owner_id                                       = &quot;829613558099&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> private_dns_hostname_type_on_launch            = &quot;ip-name&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags                                           = {
          <font color="#CC0000">-</font> &quot;Name&quot;        = &quot;nginx_private_subnet-eu-central-1c&quot;
          <font color="#CC0000">-</font> &quot;environment&quot; = &quot;dev&quot;
        } <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags_all                                       = {
          <font color="#CC0000">-</font> &quot;Name&quot;        = &quot;nginx_private_subnet-eu-central-1c&quot;
          <font color="#CC0000">-</font> &quot;environment&quot; = &quot;dev&quot;
        } <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> vpc_id                                         = &quot;vpc-0ac2c005e5cdb5684&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
    }

<b>  # aws_subnet.nginx_public_subnet[0]</b> will be <font color="#EF2929"><b>destroyed</b></font>
  <font color="#CC0000">-</font> resource &quot;aws_subnet&quot; &quot;nginx_public_subnet&quot; {
      <font color="#CC0000">-</font> arn                                            = &quot;arn:aws:ec2:eu-central-1:829613558099:subnet/subnet-0a989169acca21f8e&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> assign_ipv6_address_on_creation                = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> availability_zone                              = &quot;eu-central-1a&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> availability_zone_id                           = &quot;euc1-az2&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> cidr_block                                     = &quot;10.0.0.0/24&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> enable_dns64                                   = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> enable_resource_name_dns_a_record_on_launch    = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> enable_resource_name_dns_aaaa_record_on_launch = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> id                                             = &quot;subnet-0a989169acca21f8e&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> ipv6_native                                    = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> map_customer_owned_ip_on_launch                = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> map_public_ip_on_launch                        = true <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> owner_id                                       = &quot;829613558099&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> private_dns_hostname_type_on_launch            = &quot;ip-name&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags                                           = {
          <font color="#CC0000">-</font> &quot;Name&quot;        = &quot;nginx_public_subnet-eu-central-1a&quot;
          <font color="#CC0000">-</font> &quot;environment&quot; = &quot;dev&quot;
        } <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags_all                                       = {
          <font color="#CC0000">-</font> &quot;Name&quot;        = &quot;nginx_public_subnet-eu-central-1a&quot;
          <font color="#CC0000">-</font> &quot;environment&quot; = &quot;dev&quot;
        } <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> vpc_id                                         = &quot;vpc-0ac2c005e5cdb5684&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
    }

<b>  # aws_subnet.nginx_public_subnet[1]</b> will be <font color="#EF2929"><b>destroyed</b></font>
  <font color="#CC0000">-</font> resource &quot;aws_subnet&quot; &quot;nginx_public_subnet&quot; {
      <font color="#CC0000">-</font> arn                                            = &quot;arn:aws:ec2:eu-central-1:829613558099:subnet/subnet-0ed124df96bd8b700&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> assign_ipv6_address_on_creation                = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> availability_zone                              = &quot;eu-central-1b&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> availability_zone_id                           = &quot;euc1-az3&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> cidr_block                                     = &quot;10.0.1.0/24&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> enable_dns64                                   = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> enable_resource_name_dns_a_record_on_launch    = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> enable_resource_name_dns_aaaa_record_on_launch = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> id                                             = &quot;subnet-0ed124df96bd8b700&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> ipv6_native                                    = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> map_customer_owned_ip_on_launch                = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> map_public_ip_on_launch                        = true <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> owner_id                                       = &quot;829613558099&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> private_dns_hostname_type_on_launch            = &quot;ip-name&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags                                           = {
          <font color="#CC0000">-</font> &quot;Name&quot;        = &quot;nginx_public_subnet-eu-central-1b&quot;
          <font color="#CC0000">-</font> &quot;environment&quot; = &quot;dev&quot;
        } <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags_all                                       = {
          <font color="#CC0000">-</font> &quot;Name&quot;        = &quot;nginx_public_subnet-eu-central-1b&quot;
          <font color="#CC0000">-</font> &quot;environment&quot; = &quot;dev&quot;
        } <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> vpc_id                                         = &quot;vpc-0ac2c005e5cdb5684&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
    }

<b>  # aws_subnet.nginx_public_subnet[2]</b> will be <font color="#EF2929"><b>destroyed</b></font>
  <font color="#CC0000">-</font> resource &quot;aws_subnet&quot; &quot;nginx_public_subnet&quot; {
      <font color="#CC0000">-</font> arn                                            = &quot;arn:aws:ec2:eu-central-1:829613558099:subnet/subnet-09948f06db975c8d0&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> assign_ipv6_address_on_creation                = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> availability_zone                              = &quot;eu-central-1c&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> availability_zone_id                           = &quot;euc1-az1&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> cidr_block                                     = &quot;10.0.2.0/24&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> enable_dns64                                   = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> enable_resource_name_dns_a_record_on_launch    = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> enable_resource_name_dns_aaaa_record_on_launch = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> id                                             = &quot;subnet-09948f06db975c8d0&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> ipv6_native                                    = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> map_customer_owned_ip_on_launch                = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> map_public_ip_on_launch                        = true <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> owner_id                                       = &quot;829613558099&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> private_dns_hostname_type_on_launch            = &quot;ip-name&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags                                           = {
          <font color="#CC0000">-</font> &quot;Name&quot;        = &quot;nginx_public_subnet-eu-central-1c&quot;
          <font color="#CC0000">-</font> &quot;environment&quot; = &quot;dev&quot;
        } <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags_all                                       = {
          <font color="#CC0000">-</font> &quot;Name&quot;        = &quot;nginx_public_subnet-eu-central-1c&quot;
          <font color="#CC0000">-</font> &quot;environment&quot; = &quot;dev&quot;
        } <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> vpc_id                                         = &quot;vpc-0ac2c005e5cdb5684&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
    }

<b>  # aws_vpc.nginx_test_vpc</b> will be <font color="#EF2929"><b>destroyed</b></font>
  <font color="#CC0000">-</font> resource &quot;aws_vpc&quot; &quot;nginx_test_vpc&quot; {
      <font color="#CC0000">-</font> arn                              = &quot;arn:aws:ec2:eu-central-1:829613558099:vpc/vpc-0ac2c005e5cdb5684&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> assign_generated_ipv6_cidr_block = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> cidr_block                       = &quot;10.0.0.0/16&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> default_network_acl_id           = &quot;acl-04551a9eadc41a40d&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> default_route_table_id           = &quot;rtb-06063fb8a635fde36&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> default_security_group_id        = &quot;sg-08917579ae6f766ab&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> dhcp_options_id                  = &quot;dopt-0ae50d819b8eb7414&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> enable_classiclink               = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> enable_classiclink_dns_support   = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> enable_dns_hostnames             = false <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> enable_dns_support               = true <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> id                               = &quot;vpc-0ac2c005e5cdb5684&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> instance_tenancy                 = &quot;default&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> ipv6_netmask_length              = 0 <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> main_route_table_id              = &quot;rtb-06063fb8a635fde36&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> owner_id                         = &quot;829613558099&quot; <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags                             = {
          <font color="#CC0000">-</font> &quot;Name&quot;        = &quot;nginx_test_vpc&quot;
          <font color="#CC0000">-</font> &quot;environment&quot; = &quot;dev&quot;
        } <font color="#555753">-&gt;</font> <font color="#555753">null</font>
      <font color="#CC0000">-</font> tags_all                         = {
          <font color="#CC0000">-</font> &quot;Name&quot;        = &quot;nginx_test_vpc&quot;
          <font color="#CC0000">-</font> &quot;environment&quot; = &quot;dev&quot;
        } <font color="#555753">-&gt;</font> <font color="#555753">null</font>
    }

<b>Plan:</b> 0 to add, 0 to change, 15 to destroy.

<b>Do you really want to destroy all resources?</b>
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only &apos;yes&apos; will be accepted to confirm.

  <b>Enter a value:</b> yes 

<b>aws_route_table_association.nginx_public_1_rt_a: Destroying... [id=rtbassoc-09ed81c883c775c9a]</b>
<b>aws_security_group.mysql_sg: Destroying... [id=sg-0e73c059bd97db07f]</b>
<b>aws_db_instance.default: Destroying... [id=terraform-mysql]</b>
<b>aws_instance.nginx_server: Destroying... [id=i-0d70ce3a567a34401]</b>
<b>aws_route_table_association.nginx_public_1_rt_a: Destruction complete after 1s</b>
<b>aws_route_table.nginx_public_rt: Destroying... [id=rtb-0a09ae20ea1bd544f]</b>
<b>aws_security_group.mysql_sg: Destruction complete after 2s</b>
<b>aws_route_table.nginx_public_rt: Destruction complete after 2s</b>
<b>aws_internet_gateway.nginx_igw: Destroying... [id=igw-02c4136f6146124bc]</b>
<b>aws_instance.nginx_server: Still destroying... [id=i-0d70ce3a567a34401, 10s elapsed]</b>
<b>aws_db_instance.default: Still destroying... [id=terraform-mysql, 10s elapsed]</b>
<b>aws_internet_gateway.nginx_igw: Still destroying... [id=igw-02c4136f6146124bc, 10s elapsed]</b>
<b>aws_instance.nginx_server: Still destroying... [id=i-0d70ce3a567a34401, 20s elapsed]</b>
<b>aws_db_instance.default: Still destroying... [id=terraform-mysql, 20s elapsed]</b>
<b>aws_internet_gateway.nginx_igw: Still destroying... [id=igw-02c4136f6146124bc, 20s elapsed]</b>
<b>aws_db_instance.default: Still destroying... [id=terraform-mysql, 30s elapsed]</b>
<b>aws_instance.nginx_server: Still destroying... [id=i-0d70ce3a567a34401, 30s elapsed]</b>
<b>aws_instance.nginx_server: Destruction complete after 32s</b>
<b>aws_subnet.nginx_public_subnet[0]: Destroying... [id=subnet-0a989169acca21f8e]</b>
<b>aws_subnet.nginx_public_subnet[2]: Destroying... [id=subnet-09948f06db975c8d0]</b>
<b>aws_subnet.nginx_public_subnet[1]: Destroying... [id=subnet-0ed124df96bd8b700]</b>
<b>aws_internet_gateway.nginx_igw: Still destroying... [id=igw-02c4136f6146124bc, 30s elapsed]</b>
<b>aws_subnet.nginx_public_subnet[0]: Destruction complete after 1s</b>
<b>aws_subnet.nginx_public_subnet[2]: Destruction complete after 1s</b>
<b>aws_subnet.nginx_public_subnet[1]: Destruction complete after 2s</b>
<b>aws_internet_gateway.nginx_igw: Destruction complete after 31s</b>
<b>aws_db_instance.default: Still destroying... [id=terraform-mysql, 40s elapsed]</b>
<b>aws_db_instance.default: Still destroying... [id=terraform-mysql, 50s elapsed]</b>
<b>aws_db_instance.default: Still destroying... [id=terraform-mysql, 1m0s elapsed]</b>
<b>aws_db_instance.default: Still destroying... [id=terraform-mysql, 1m10s elapsed]</b>
<b>aws_db_instance.default: Still destroying... [id=terraform-mysql, 1m20s elapsed]</b>
<b>aws_db_instance.default: Still destroying... [id=terraform-mysql, 1m30s elapsed]</b>
<b>aws_db_instance.default: Still destroying... [id=terraform-mysql, 1m40s elapsed]</b>
<b>aws_db_instance.default: Still destroying... [id=terraform-mysql, 1m50s elapsed]</b>
<b>aws_db_instance.default: Still destroying... [id=terraform-mysql, 2m0s elapsed]</b>
<b>aws_db_instance.default: Still destroying... [id=terraform-mysql, 2m10s elapsed]</b>
<b>aws_db_instance.default: Still destroying... [id=terraform-mysql, 2m20s elapsed]</b>
<b>aws_db_instance.default: Still destroying... [id=terraform-mysql, 2m30s elapsed]</b>
<b>aws_db_instance.default: Still destroying... [id=terraform-mysql, 2m40s elapsed]</b>
<b>aws_db_instance.default: Still destroying... [id=terraform-mysql, 2m50s elapsed]</b>
<b>aws_db_instance.default: Still destroying... [id=terraform-mysql, 3m0s elapsed]</b>
<b>aws_db_instance.default: Still destroying... [id=terraform-mysql, 3m10s elapsed]</b>
<b>aws_db_instance.default: Still destroying... [id=terraform-mysql, 3m20s elapsed]</b>
<b>aws_db_instance.default: Still destroying... [id=terraform-mysql, 3m30s elapsed]</b>
<b>aws_db_instance.default: Still destroying... [id=terraform-mysql, 3m40s elapsed]</b>
<b>aws_db_instance.default: Still destroying... [id=terraform-mysql, 3m50s elapsed]</b>
<b>aws_db_instance.default: Destruction complete after 3m52s</b>
<b>aws_db_subnet_group.nginx_db_subnet: Destroying... [id=terraform-mysql-subnet-group]</b>
<b>aws_security_group.nginx_sg: Destroying... [id=sg-092bb82959bcba6c3]</b>
<b>aws_db_subnet_group.nginx_db_subnet: Destruction complete after 0s</b>
<b>aws_subnet.nginx_private_subnet[2]: Destroying... [id=subnet-01cd877c27caea4dc]</b>
<b>aws_subnet.nginx_private_subnet[0]: Destroying... [id=subnet-0f535eab7e2b1f0ce]</b>
<b>aws_subnet.nginx_private_subnet[1]: Destroying... [id=subnet-084713edb23129f23]</b>
<b>aws_security_group.nginx_sg: Destruction complete after 1s</b>
<b>aws_subnet.nginx_private_subnet[2]: Destruction complete after 1s</b>
<b>aws_subnet.nginx_private_subnet[0]: Destruction complete after 1s</b>
<b>aws_subnet.nginx_private_subnet[1]: Destruction complete after 2s</b>
<b>aws_vpc.nginx_test_vpc: Destroying... [id=vpc-0ac2c005e5cdb5684]</b>
<b>aws_vpc.nginx_test_vpc: Destruction complete after 0s</b>

<font color="#8AE234"><b>Destroy complete! Resources: 15 destroyed.</b></font>

┌─[ 4:59][][<font color="#4E9A06">alexLaptop</font>][<font color="#8AE234"><b>±</b></font>][main U:1 ?:1 <font color="#EF2929"><b>✗</b></font>]
├─[<font color="#06989A">~/_GIT/github/EPAM/devops-school-terraform/Task2</font>]
└─▪ 
</pre>
