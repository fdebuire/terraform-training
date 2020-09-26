# Variables
variable "ubuntu_ami" {}
variable "private_subnet_id_1" {}
variable "vpc_id" {}
variable "web_server_sg_id" {}
variable "ansible_controller_sg_id" {}

# Resources
resource "aws_instance" "fred_db_server" {
  ami                    = var.ubuntu_ami
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.fred_db_server_sg.id]
  key_name               = "fdebuire_training"
  subnet_id              = var.private_subnet_id_1

  tags = {
    Name = "fdebuire Db Server"
  }
}

resource "aws_security_group" "fred_db_server_sg" {
  name        = "fred_allow_inbound_db_server_sg"
  description = "Allow inbound traffic to Db Server"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow MariaDB"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.web_server_sg_id]
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
    Name = "fdebuire DB Server SG"
  }
}
