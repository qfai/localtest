terraform {
  backend "azurerm" {
    resource_group_name  = "qukeprodprofile"
    storage_account_name = "profilebackend"
    container_name       = "tfbackend"
    key                  = "hasite.tfstate"
    use_azuread_auth     = true
    subscription_id      = "9688b0ae-bd2c-497a-adb7-155619d7ccda"
  }
}
