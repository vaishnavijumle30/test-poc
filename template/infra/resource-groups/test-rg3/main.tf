terraform {
  backend "local" {
    path = "state/terraform.tfstate"
  }
}
# Resource Group
resource "azurerm_resource_group" "this" {
  name     = "test-rg-dev3"
  location = var.location
}
