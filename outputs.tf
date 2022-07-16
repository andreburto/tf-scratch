output "new_domain" {
  value = "http://${var.app_name}.${var.domain_base}/"
}