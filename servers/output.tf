#output "dns_name" {
#  value = aws_instance.web[count.index].public_dns
#}

output "ip_address" {
  value = "${aws_instance.web[*].public_ip}"
}