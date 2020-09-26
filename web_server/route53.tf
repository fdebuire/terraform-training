variable "dns_zone_id" {}

resource "aws_route53_record" "web_server_record" {
  zone_id = var.dns_zone_id
  name    = "fdebuire.training.org"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.fred_web_server_eip.public_ip]
}