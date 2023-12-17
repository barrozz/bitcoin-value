

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


# data "azurerm_container_registry" "bitcoinvalues" {
#   name                = "bitcoinvalues"
#   resource_group_name = azurerm_resource_group.aks-rg.name
# }

# Allow AKS Cluster access to Azure Container Registry
resource "azurerm_role_assignment" "role_acrpull" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity.0.object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true

  depends_on = [
    azurerm_container_registry.acr,
    azurerm_kubernetes_cluster.aks
  ]
}