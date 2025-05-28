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
  ami           = "ami-075686beab831bb7f"
  instance_type = "t2.medium"
  key_name      = "minecraft_project_2" # Replace with your key pair name

  
  associate_public_ip_address = true


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