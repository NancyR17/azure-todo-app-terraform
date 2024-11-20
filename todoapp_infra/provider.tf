terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.85.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "82812723-cb7c-49c5-b697-018df19bfc17"
}
