module "resource_group" {
  source   = "./modules/resource-group"
  name     = var.resource_group_name
  location = var.location
}

module "observability" {
  source              = "./modules/observability"
  name                = var.observability_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
}

module "storage_account" {
  source              = "./modules/storage-account"
  name                = var.storage_account_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name

  container_name = "files"

  tags = {
    environment = var.environment
  }
}

module "sql_database" {
  source              = "./modules/sql-database"
  server_name         = var.sql_server_name
  database_name       = var.sql_database_name
  location            = var.db_location
  resource_group_name = module.resource_group.name

  admin_username = var.sql_admin_username
  admin_password = var.sql_admin_password

  tags = {
    environment = var.environment
  }
}

module "container_registry" {
  source              = "./modules/container-registry"
  name                = var.container_registry_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
}

module "container_apps" {
  source                        = "./modules/container-apps"
  environment_name              = "${var.environment}-cae"
  location                      = module.resource_group.location
  resource_group_name           = module.resource_group.name
  log_analytics_workspace_id    = module.observability.id

  frontend_name  = "${var.environment}-frontend"
  backend_name   = "${var.environment}-backend"

  frontend_image = var.frontend_image
  backend_image  = var.backend_image
}
