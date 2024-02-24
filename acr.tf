

resource "azurerm_user_assigned_identity" "acr_identity" {
  name                = "${random_pet.prefix.id}-identity"
  resource_group_name = azurerm_resource_group.aks-rg.name
  location            = azurerm_resource_group.aks-rg.location

  depends_on = [azurerm_resource_group.aks-rg,
  ]

}

resource "azurerm_container_registry" "acr" {
  name                = "bitcoinvalues"
  resource_group_name = azurerm_resource_group.aks-rg.name
  location            = azurerm_resource_group.aks-rg.location
  sku                 = "Standard" # Choose SKU based on your needs
  admin_enabled       = true

  tags = {
    environment = "Development"
  }
}

output "container_registry_login_server" {
  value = azurerm_container_registry.acr.login_server
}