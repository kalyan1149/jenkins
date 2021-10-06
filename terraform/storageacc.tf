provider "azurerm" {
  features {}
}
#create resource group
resource "azurerm_resource_group" "rg" {
    name     = var.resourcegroupname
    location = "westus"
}

#Create Storage Account
module "storage_account" {
  source    = "./modules/storage-account"

  saname    = var.storageaccname
  rgname    = azurerm_resource_group.rg.name
  location  = azurerm_resource_group.rg.location
}