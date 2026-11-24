variable "resource_group" {
  description = "A mapping of resource group names to their properties."
  type = map(object({
    name     = string
    location = string
  }))
}
