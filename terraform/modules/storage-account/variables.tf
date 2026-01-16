variable "name" {
  description = "Storage Account name"
  type        = string
}

variable "container_name" {
  description = "Blob container name"
  type        = string
  default     = "files"
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
