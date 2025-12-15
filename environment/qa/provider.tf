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
    storage_account_name = "tattu102"
    container_name       = "con99"
    key                  = "qa_orange.terraform_state"
  }
}
provider "azurerm" {
  features {
        resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = "a0366c1d-7e23-4176-93a9-0e084725b2d4"
}
