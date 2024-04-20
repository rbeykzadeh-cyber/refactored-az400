terraform {
  required_version = ">= 1.4.0, < 2.0.0"

  backend "azurerm" {}

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.52.0, < 4.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}
