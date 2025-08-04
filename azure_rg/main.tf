variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "resource_location_name" {
  description = "Location Nmae of the resource group"
}

variable "owner_tag" {
  description = "Owner of the resource"
}

variable "env_tag" {
  description = "Environment Name in which resources will be deployed"
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_location_name
  tags = {
    Owner = var.owner_tag
    Env   = var.env_tag
  }
}