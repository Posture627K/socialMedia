variable "location" {
  description = "The Azure region in which all resources will be created."
  default     = "eastus"
}

variable "local_username" {
  description = "The local username for the ssh key path."
}

variable "acr_username" {
  description = "The username for the Azure Container Registry."
  default = "csci3130projectregistry"
}

variable "acr_password" {
  description = "The password for the Azure Container Registry"
}
