
output "virtual_network_id" {
  value = azurerm_virtual_network.bhvnetsandbox001.id
}

output "subnet_ids" {
  value = [for subnet_key, subnet_value in azurerm_virtual_network.bhvnetsandbox001.subnet : subnet_value.id]
}