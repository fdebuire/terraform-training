# Outputs
output "ansible_id" {
  value = module.ansible_controller.ansible_controller_id
}

output "ansible_public_ip" {
  value = module.ansible_controller.ansible_controller_public_ip
}

output "db_id" {
  value = module.db_server.db_id
}

output "db_private_ip" {
  value = module.db_server.db_private_ip
}

output "web_id" {
  value = module.web_server.web_id
}

output "web_public_ip" {
  value = module.web_server.web_public_ip
}

output "web_dns" {
  value = module.web_server.web_server_dns
}