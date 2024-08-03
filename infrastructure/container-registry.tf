resource "azurerm_container_registry" "container_registry" {
  name                = "csci3130projectregistry"
  resource_group_name = azurerm_resource_group.project.name
  location            = var.location
  admin_enabled       = true
  sku                 = "Basic"
}

output "reigstry_hostname" {
  value = azurerm_container_registry.container_registry.login_server
}

output "registry_username" {
  value = azurerm_container_registry.container_registry.admin_username
}
