terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# SSM stuff
resource "aws_ssm_parameter" "test" {
  name    = var.ssm_key
  type    = var.ssm_type
  value   = var.ssm_value
}
