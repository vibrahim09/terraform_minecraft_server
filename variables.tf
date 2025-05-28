variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type to use"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the SSH key pair to use"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC to launch the instance in"
  type        = string
  
}

variable "instance_name" {
  description = "The name of the instance"
  type        = string
}
