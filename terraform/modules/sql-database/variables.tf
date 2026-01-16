variable "server_name" {
  description = "SQL Server name"
  type        = string
}

variable "database_name" {
  description = "Database name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "admin_username" {
  description = "SQL admin username"
  type        = string
}

variable "admin_password" {
  description = "SQL admin password"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
