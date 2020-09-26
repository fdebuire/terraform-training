output "web_id" {
  value = aws_instance.fred_web_server.id
}

output "web_public_ip" {
  value = aws_eip.fred_web_server_eip.public_ip
}

output "web_sg_id" {
  value = aws_security_group.fred_web_server_sg.id
}

output "web_server_dns" {
  value = aws_route53_record.web_server_record.name
}
