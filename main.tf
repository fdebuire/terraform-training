# Modules
module "vpc" {
  source = "./vpc"
}

module "ansible_controller" {
  source             = "./ansible_controller"
  ansible_ami        = local.ansible_ami
  vpc_id             = module.vpc.vcp_id
  public_subnet_id_1 = module.vpc.public_subnet_id_1
}

module "db_server" {
  source                   = "./db_server"
  ubuntu_ami               = local.ubuntu_ami
  vpc_id                   = module.vpc.vcp_id
  private_subnet_id_1      = module.vpc.private_subnet_id_1
  web_server_sg_id         = module.web_server.web_sg_id
  ansible_controller_sg_id = module.ansible_controller.ansible_controller_sg_id
}

module "web_server" {
  source                   = "./web_server"
  ubuntu_ami               = local.ubuntu_ami
  vpc_id                   = module.vpc.vcp_id
  dns_zone_id              = var.dns_zone_id
  public_subnet_id_1       = module.vpc.public_subnet_id_1
  ansible_controller_sg_id = module.ansible_controller.ansible_controller_sg_id
}