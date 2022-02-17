# output "aws_alb_public_dns" {
#   value = aws_lb.nginx.dns_name
# }

# output "CIDR_net_address" {
#   count = "${length(data.aws_availability_zones.available.names)}"
#   value = "${count.index}"
# }
