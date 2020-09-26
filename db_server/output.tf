output "db_id" {
  value = aws_instance.fred_db_server.id
}

output "db_private_ip" {
  value = aws_instance.fred_db_server.private_ip
}
