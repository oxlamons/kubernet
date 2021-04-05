terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
         }
  }
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.aws_region
}
data "aws_route53_zone" "selected" {
  name = "tymt"
}
resource "aws_route53_record" "tymtym" {
  count   = 1
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "www.tymtym.tk"
  type    = "A"
  ttl     = "300"
  records = ["${element(hcloud_server.node1.*.ipv4_address, count.index)}"]