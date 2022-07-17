output "new_domain" {
  value = "http://${var.app_name}.${var.domain_base}/"
}

output "lambda_repo" {
  value = module.ecr.repository_url
}