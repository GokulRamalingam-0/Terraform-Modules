variable "vnet_name" {
    description = "Vnet Name for resources"
}

variable "resource_group_name" {
    description = "Resource group name for Vnet"
}

variable "resource_location_name" {
    description = "Location for Vnet"
}

variable "address_space" {
    description = "Vnet subne address space"
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.resource_location_name
  address_space       = [var.address_space]
}