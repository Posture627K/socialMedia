resource "azurerm_container_group" "container" {
  name                = "csci3130project"
  location            = var.location
  resource_group_name = azurerm_resource_group.project.name
  os_type             = "Linux"

  image_registry_credential {
    server   = "csci3130projectregistry.azurecr.io"
    username = var.acr_username
    password = var.acr_password
  }

  container {
    name   = "react-frontend"
    image  = "csci3130projectregistry.azurecr.io/react-frontend:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }

    environment_variables = {
      "LOGIN_BACKGROUN_PATH" = "img/background.png"
      "LOGO_PATH"            = "img/fox.png"
      "VITE_API_URL"         = "http://csci3130project.eastus.azurecontainer.io:8080"
    }
  }

  container {
    name   = "spring-backend"
    image  = "csci3130projectregistry.azurecr.io/spring-backend:latest"
    cpu    = "1.0"
    memory = "2"

    ports {
      port     = 8080
      protocol = "TCP"
    }
  }

  ip_address_type = "Public"
  dns_name_label  = "csci3130project"
}

output "container_group_fqdn" {
  value = azurerm_container_group.container.fqdn
}
