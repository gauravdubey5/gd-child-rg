terraform {
  required_version = ">= 1.5.0, < 2.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.75.0, < 5.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "rg" {
  source = "../../"

  name     = var.name
  location = var.location
  tags     = var.tags
}
