variable "name" {
  description = "The name of the Resource Group. Must be between 1 and 90 characters and cannot end with a period."
  type        = string

  validation {
    condition     = length(var.name) >= 1 && length(var.name) <= 90 && !endswith(var.name, ".")
    error_message = "Resource group name must be 1-90 characters long and must not end with a period."
  }
}

variable "location" {
  description = "The Azure Region where the Resource Group should exist."
  type        = string
}

variable "tags" {
  description = "A mapping of tags which should be assigned to this Resource Group."
  type        = map(string)
  default     = {}
}

variable "lock_level" {
  description = "Specifies the lock level for the Resource Group. Possible values are 'CanNotDelete', 'ReadOnly', or null/empty string for no lock."
  type        = string
  default     = null

  validation {
    condition     = var.lock_level == null || var.lock_level == "" || contains(["CanNotDelete", "ReadOnly"], coalesce(var.lock_level, ""))
    error_message = "Lock level must be either 'CanNotDelete', 'ReadOnly', or null/empty."
  }
}

variable "lock_name" {
  description = "Specifies the name of the management lock. If not specified, a default name will be generated."
  type        = string
  default     = null
}
