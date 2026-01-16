output "frontend_fqdn" {
  value = azurerm_container_app.frontend.latest_revision_fqdn
}

output "backend_internal_url" {
  value = "http://${var.backend_name}"
}
