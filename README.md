# Terraform Modules for Azure

This repository contains reusable Terraform modules to provision and manage resources in Microsoft Azure.

## Modules Included

- **Resource Group Module**  
  Creates Azure Resource Groups.

- **Virtual Network (VNet) Module**  
  Provisions VNets with configurable address spaces and subnets.

- **Virtual Machine (VM) Module**  
  Deploys Azure Virtual Machines with network interface and disk configurations.

## Usage

Each module is defined in its own subdirectory:

- `azure_rg/`
- `azure_vnet/`
- `azure_vm/`

### Example

You can use these modules like this in your root Terraform file:

```hcl
module "resource_group" {
  source     = "./azure_rg"
  rg_name    = "my-rg"
  location   = "East US"
}

module "vnet" {
  source              = "./azure_vnet"
  vnet_name           = "my-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "East US"
  resource_group_name = module.resource_group.rg_name
}

module "vm" {
  source              = "./azure_vm"
  vm_name             = "my-vm"
  location            = "East US"
  resource_group_name = module.resource_group.rg_name
  subnet_id           = module.vnet.subnet_id
}
