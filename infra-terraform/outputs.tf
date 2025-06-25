output "private_key_pem" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}

output "instance_ip" {
  value = aws_instance.dev.public_ip
}
