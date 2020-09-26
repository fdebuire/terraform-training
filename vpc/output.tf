output "public_subnet_id_1" {
  value = aws_subnet.main_public_1.id
}

output "private_subnet_id_1" {
  value = aws_subnet.main_private_1.id
}

output "vcp_id" {
  value = aws_vpc.main.id
}