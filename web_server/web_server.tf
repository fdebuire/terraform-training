# Variables
variable "ubuntu_ami" {}
variable "public_subnet_id_1" {}
variable "vpc_id" {}
variable "ansible_controller_sg_id" {}

# Resources
resource "aws_instance" "fred_web_server" {
  ami                    = var.ubuntu_ami
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.fred_web_server_sg.id]
  key_name               = "fdebuire_training"
  subnet_id              = var.public_subnet_id_1

  tags = {
    Name = "fdebuire Web Server"
  }
}

resource "aws_eip" "fred_web_server_eip" {
  instance = aws_instance.fred_web_server.id
  vpc      = true

  tags = {
    Name = "fdebuire Web Server EIP"
  }
}

resource "aws_security_group" "fred_web_server_sg" {
  name        = "fred_allow_inbound_web_server_sg"
  description = "Allow inbound traffic to Web Server"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow Ping"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    for_each = [22, 80, 443]
    content {
      description = "Allow SSH, HTTP and HTTPS"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      security_groups = [var.ansible_controller_sg_id]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "fdebuire Web Server SG"
  }
}
