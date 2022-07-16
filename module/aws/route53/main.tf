terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# DNS stuff
resource "aws_route53_record" "site_domain" {
  zone_id = var.zone_id
  name = "${var.domain}."
  type = "A"

  alias {
    name = var.bucket_domain
    zone_id = var.bucket_zone_id
    evaluate_target_health = false
  }
}
