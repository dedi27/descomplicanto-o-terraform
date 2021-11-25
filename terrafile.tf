module "servers" {
    source = "./servers"
    servers = 1
    blocks =  var.blocks
    providers = {
      aws = aws.us1
     }
}

output "ip_address" {
  value = module.servers.ip_address
}