provider "aws" {
  region = "us-east-1"
  profile = var.profile 
}

resource "asw_instance" "rmq" {
  ami = "ami-0022f774911c1d690"
  instance_type = "t2.micro"
  key_name = "rabbitmq"
  vpc_security_group_ids = [ "sg-0bf17fff534759844" ]

  tags = {
      Name = var.name 
      group = var.group
  }
}