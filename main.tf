terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta2"
    }
  }
    required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
  shared_credentials_files = [ 
    "${path.module}/.aws/credentials"
  ]
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
