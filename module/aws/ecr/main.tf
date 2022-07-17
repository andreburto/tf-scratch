terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_ecr_repository" "lambda_repo" {
  name = var.repository_name

  image_scanning_configuration {
    scan_on_push = false
  }
}