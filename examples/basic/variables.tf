variable "name" {
  description = "The name of the Resource Group."
  type        = string
  default     = "rg-example-basic"
}

variable "location" {
  description = "The Azure Region."
  type        = string
  default     = "eastus2"
}

variable "tags" {
  description = "Resource tags."
  type        = map(string)
  default = {
    Environment = "example"
    ManagedBy   = "Terraform"
  }
}
