output "id" {
  description = "The ID of the Resource Group."
  value       = azurerm_resource_group.resource_groups.id
}

output "name" {
  description = "The name of the Resource Group."
  value       = azurerm_resource_group.resource_groups.name
}

output "location" {
  description = "The location of the Resource Group."
  value       = azurerm_resource_group.resource_groups.location
}

output "tags" {
  description = "The tags assigned to the Resource Group."
  value       = azurerm_resource_group.resource_groups.tags
}
