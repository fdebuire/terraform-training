# Variables
locals {
  ansible_ami = "ami-0b083b687afa59ceb"
  ubuntu_ami  = "ami-0eb89db7593b5d434"
}

variable "dns_zone_id" {
  default = "Z3QBTCN87WIQZ8"
}