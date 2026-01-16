variable "location" {
  type    = string
  default = "East US"
}

variable "resource_group_name" {
  type = string
}

variable "observability_name" {
  type = string
}

variable "container_registry_name"{
  type = string
}

variable "storage_account_name"{
  type = string
}

variable "environment" {
  type    = string
  default = "poc"
}

variable "db_location" {
  type    = string
  default = "westus2"
}
variable "sql_server_name" {
  type = string
}

variable "sql_database_name" {
  type = string
}

variable "sql_admin_username" {
  type = string
}

variable "sql_admin_password" {
  type      = string
  sensitive = true
}
variable "backend_image" {
  type = string
}
variable "frontend_image" {
  type = string
}