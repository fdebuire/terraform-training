# Variables
variable "ansible_ami" {}
variable "public_subnet_id_1" {}
variable "vpc_id" {}

# Resources
resource "aws_instance" "fred_ansible_controller" {
  ami                    = var.ansible_ami
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.fred_ansible_controller_sg.id]
  key_name               = "fdebuire_training"
  subnet_id              = var.public_subnet_id_1

  tags = {
    Name = "fdebuire Ansible controller"
  }
}

resource "aws_security_group" "fred_ansible_controller_sg" {
  name        = "fred_allow_inbound_ansible_controller_sg"
  description = "Allow inbound traffic to Ansible Controller"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow Ping"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "fdebuire Ansible Controller SG"
  }
}
