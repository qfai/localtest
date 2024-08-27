terraform {
  backend "azurerm" {
    resource_group_name  = "jundachen"
    storage_account_name = "arcsctest"
    container_name       = "tfbackend"
    key                  = "sample.tfstate"
    use_azuread_auth     = true
    subscription_id      = "b9e38f20-7c9c-4497-a25d-1a0c5eef2108"
  }
}
