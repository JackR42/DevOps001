provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {}
}

data "azurerm_key_vault" "project42" {
  name                = "S2-KeyVault42"
  resource_group_name = "S2-RG-DevOps42"
}
data "azurerm_key_vault_secret" "secret1" {
  name         = "DatabaseAdminUserName"
  key_vault_id = data.azurerm_key_vault.project42.id
}
data "azurerm_key_vault_secret" "secret2" {
  name         = "DatabaseAdminPassword"
  key_vault_id = data.azurerm_key_vault.project42.id
}


resource "azurerm_resource_group" "project42" {
  name = "S2-RG-DevOps001"
  location = "westeurope"
}
