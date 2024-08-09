terraform {
  backend "azurerm" {
    resource_group_name  = "zilutest"
    storage_account_name = "ziluiacbackend"
    container_name       = "tfbackend"
    key                  = "quickinstance.tfstate"
    use_azuread_auth     = true
    subscription_id      = "586c20df-c465-4f10-8673-65aa4859e7ca"
  }
}
