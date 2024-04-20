resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_management_lock" "resource_group_lock" {
  count      = var.lock == true ? 1 : 0
  name       = "${var.resource_group_name}-lock"
  scope      = azurerm_resource_group.rg.id
  lock_level = var.lock_level
  notes      = "Resource Lock Applied to protect ${azurerm_resource_group.rg.name}"
}