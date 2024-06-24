output "instance_id" {
  value = aws_instance.strapi.id
}

output "instance_public_ip" {
  value = aws_instance.strapi.public_ip
}