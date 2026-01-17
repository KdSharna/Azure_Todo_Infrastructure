terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.55.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "pintu11"
    storage_account_name = "tattu100"
    container_name       = "con99"
    key                  = "dev_orange.terraform_state"
  }
}
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = "9e5164c3-5dce-42e1-abfe-6be582de11d8"
#   tenant_id       = var.tenant_id
#   client_id       = var.client_id
#   client_secret   = var.client_secret
}
