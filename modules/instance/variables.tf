variable "ami_id" {
  description = "AMI ID used for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the private subnet"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the public subnet"
  type        = string
}

variable "private_security_group_id" {
  description = "ID of the private security group"
  type        = string
}

variable "public_security_group_id" {
  description = "ID of the public security group"
  type        = string
}

variable "key_name" {
  description = "AWS key pair name"
  type        = string
}