output "ansible_controller_id" {
  value = aws_instance.fred_ansible_controller.id
}

output "ansible_controller_public_ip" {
  value = aws_instance.fred_ansible_controller.public_ip
}

output "ansible_controller_sg_id" {
  value = aws_security_group.fred_ansible_controller_sg.id
}
