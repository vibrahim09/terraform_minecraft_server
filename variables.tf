variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "Minecraft Server"
}

variable "vpc_id" {
  description = "VPC ID where the EC2 instance will be launched"
  type        = string
  default     = "vpc-12345678" # Replace with your VPC ID
}