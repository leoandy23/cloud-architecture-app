resource "azurerm_container_app_environment" "this" {
  name                       = var.environment_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  log_analytics_workspace_id = var.log_analytics_workspace_id
}

# =====================
# Backend (internal)
# =====================
resource "azurerm_container_app" "backend" {
  name                         = var.backend_name
  container_app_environment_id = azurerm_container_app_environment.this.id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"

  template {
    container {
      name   = "backend"
      image  = var.backend_image
      cpu    = 0.5
      memory = "1Gi"
    }
  }

  ingress {
    external_enabled = false
    target_port      = 80

    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }
}

# =====================
# Frontend (public)
# =====================
resource "azurerm_container_app" "frontend" {
  name                         = var.frontend_name
  container_app_environment_id = azurerm_container_app_environment.this.id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"

  template {
    container {
      name   = "frontend"
      image  = var.frontend_image
      cpu    = 0.5
      memory = "1Gi"

      env {
        name  = "BACKEND_URL"
        value = "http://${var.backend_name}"
      }
    }
  }

  ingress {
    external_enabled = true
    target_port      = 80

    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }
}
