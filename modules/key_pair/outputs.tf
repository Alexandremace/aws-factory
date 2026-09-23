output "key_name" {
  description = "Name of the AWS key pair"
  value       = aws_key_pair.web.key_name
}