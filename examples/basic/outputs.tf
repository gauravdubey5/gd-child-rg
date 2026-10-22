output "resource_group_id" {
  description = "Resource Group ID"
  value       = module.rg.id
}

output "resource_group_name" {
  description = "Resource Group Name"
  value       = module.rg.name
}

output "resource_group_location" {
  description = "Resource Group Location"
  value       = module.rg.location
}
