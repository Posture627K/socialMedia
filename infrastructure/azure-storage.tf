resource "azurerm_storage_account" "storage" {
  name                     = "csci3130projectstorage"
  resource_group_name      = azurerm_resource_group.project.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "terraform_state" {
  name                  = "csci3130projectterraformstate"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}