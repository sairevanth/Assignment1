terraform {
  backend "azurerm" {
    resource_group_name  = "tfstateN01600239RG"
    storage_account_name = "tfstate0239sa"
    container_name       = "tfstatefiles"
    key                  = "assignment1-tfstate"
  }
}
