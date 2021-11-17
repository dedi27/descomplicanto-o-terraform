data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Ubuntu
}

resource "aws_instance" "web" {
  #count = var.environment == "production" ? 2 + var.plus : 1
  #count = var.servers
  #ami           = "ami-09e67e426f25ce0d7"
  count = var.production ? 2 + var.plus : 1
  ami = data.aws_ami.ubuntu.id
  instance_type = count.index < 1 ? "t2.micro" : "t3.medium"

  tags = {
    Name = "HelloWorld-${count.index+1}"
  }
}