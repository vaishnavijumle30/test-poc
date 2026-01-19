
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.80.0"
    }
  }
  backend "azurerm" {} # backend values provided via -backend-config during init
}

provider "azurerm" {
  features {}
}
