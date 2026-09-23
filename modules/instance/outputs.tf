output "private_instance_id" {
  description = "ID of the private EC2 instance"
  value       = aws_instance.web_priv.id
}

output "private_instance_ip" {
  description = "Private IP of the private EC2 instance"
  value       = aws_instance.web_priv.private_ip
}

output "public_instance_id" {
  description = "ID of the public EC2 instance"
  value       = aws_instance.web_pub.id
}

output "public_instance_ip" {
  description = "Public IP of the public EC2 instance"
  value       = aws_instance.web_pub.public_ip
}