#output "dns_name" {
#  value = aws_instance.web[count.index].public_dns
#}

output "ip_address" {
  #value = "${aws_instance.web[*].public_ip}"
  value = {
    for instance in aws_instance.web:
      instance.id => instance.public_ip
    }
}