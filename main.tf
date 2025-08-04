# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

terraform {
  backend "azurerm" {
    resource_group_name   = "Terraform-Backend"
    storage_account_name  = "terraformstatestorage136"
    container_name        = "tfstate"
    key                   = "prod.terraform.tfstate"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

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

variable "vnet_name" {
    description = "Vnet Name for resources"
}

variable "address_space" {
    description = "Vnet subnet address space"
}


module "azure_rg" {
    source = "./azure_rg"
    resource_group_name = var.resource_group_name
    resource_location_name = var.resource_location_name
    owner_tag = var.owner_tag
    env_tag = var.env_tag
}

module "azure_vnet" {
    source = "./azure_vnet"
    resource_group_name = var.resource_group_name
    resource_location_name = var.resource_location_name
    vnet_name = var.vnet_name
    address_space = var.address_space
    depends_on = [
        module.azure_rg
    ]
}