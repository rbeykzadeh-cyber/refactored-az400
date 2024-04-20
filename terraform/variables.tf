variable "resource_group_name" {
  type        = string
  description = "Name to be attatched to the resource group."
}

variable "tags" {
  type        = map(string)
  description = "Tags to be attached to the resources."
}

variable "location" {
  type        = string
  description = "Azure location for the resource group."
}

variable "lock" {
  type        = bool
  description = "Applies a lock to the RG if set to true."
}

variable "lock_level" {
  type        = string
  description = "The type of lock to apply, choices are 'CanNotDelete' or 'ReadOnly'."
}
