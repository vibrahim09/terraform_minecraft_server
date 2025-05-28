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

resource "aws_instance" "minecraft_project_2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [aws_security_group.minecraft_project_2_sg.id]
  key_name      = vars.key_name

  tags = {
    Name = var.instance_name
  }
}

resource "aws_security_group" "minecraft_project_2_sg" {
  name        = "minecraft_project_2_sg"
  description = "Security group for the Minecraft server"

  ingress {
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0/0"] # Allow all IPs to connect to the Minecraft server
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0/0"] # Allow SSH access from anywhere (not recommended for production)
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0/0"]
  }
  tags = {
    Name = "minecraft_project_2_sg"
  }
}

resource aws_key_pair "minecraft_project_2_key" {
  key_name   = var.key_name
  public_key = file("${path.module}/.aws/keys/${var.key_name}.pub") # Ensure the public key exists in the specified path
}