
# Virtual Network Resource Block
resource "azurerm_virtual_network" "bhvnetsandbox001" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = var.vnet_tags

  # Subnets
  dynamic "subnet" {
    for_each = var.subnet
    content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
    }
  }

  dynamic "encryption" {
    for_each = var.encryption
    content {
      enforcement = encryption.value.enforcement
    }
  }

    dynamic "ddos_protection_plan" {
    for_each = var.ddos_enable_pp && var.ddos_pp ? [1] : []
    content {
      id     = azurerm_network_ddos_protection_plan.ddospp.id
      enable = true
    }
  }
}

resource "azurerm_network_ddos_protection_plan" "ddospp" {
  name                = var.ddos_pp_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags = var.vnet_tags
}



