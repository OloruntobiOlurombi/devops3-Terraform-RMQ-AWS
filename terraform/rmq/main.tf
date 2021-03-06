terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = var.profile 
}

resource "aws_instance" "rmq" {
  ami = "ami-0022f774911c1d690"
  instance_type = "t2.micro"
  key_name = "rabbitmq"
  vpc_security_group_ids = [ "sg-0bf17fff534759844" ]

  tags = {
      Name = var.name 
      group = var.group
  }
}