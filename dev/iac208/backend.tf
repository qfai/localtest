terraform {
  backend "azurerm" {
    resource_group_name  = "backend"
    storage_account_name = "terrbackend"
    container_name       = "backend"
    key                  = "iac208.tfstate"
    use_azuread_auth     = true
    subscription_id      = "586c20df-c465-4f10-8673-65aa4859e7ca"
  }
}
