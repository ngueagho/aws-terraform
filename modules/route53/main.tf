terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}




resource "aws_route53_record" "www" {
  zone_id = var.zone-id

  name    = "roberto.worketyamo.com"
  type    = "A"
  ttl     = 300
#   records = [aws_eip.lb.public_ip]
    records = [ var.ec2_ip ]
}