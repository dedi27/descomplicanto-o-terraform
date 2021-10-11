module "servers" {
    source = "./servers"
    servers = 2
    providers = {
      aws = aws.us1
     }
}

output "ip_address" {
  value = module.servers.ip_address
}