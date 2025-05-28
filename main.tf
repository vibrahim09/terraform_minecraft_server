terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0-beta2"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
  shared_credentials_files = [
    "${path.module}/.aws/credentials"
  ]
}

resource "aws_instance" "app_server" {
  ami           = "ami-075686beab831bb7f"
  instance_type = "t2.medium"
  key_name      = "minecraft_project_2" # Replace with your key pair name
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  security_groups = [aws_security_group.app_sg.name]
  
  associate_public_ip_address = true


  tags = {
    Name = var.instance_name
  }
}
