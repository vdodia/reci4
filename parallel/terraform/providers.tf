terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      # 4.x requires subscription_id in the provider block.
      # 3.x uses the subscription from `az login` / `az account show`.
      version = "~> 3.117"
    }
  }
}

provider "azurerm" {
  features {}
}
