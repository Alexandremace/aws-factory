variable "key_path" {
  description = "Path where the generated private key will be stored"
  type        = string
}

variable "ami_id" {
  description = "AMI ID used for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}