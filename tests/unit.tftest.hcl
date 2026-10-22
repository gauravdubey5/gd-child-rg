# Unit test for gd-child-rg using plan mode (no live deployment needed)

mock_provider "azurerm" {}

run "verify_resource_group_plan" {
  command = plan

  variables {
    name       = "rg-test-unit-001"
    location   = "eastus2"
    lock_level = "CanNotDelete"
    tags = {
      Environment = "test"
    }
  }

  assert {
    condition     = azurerm_resource_group.rg.name == "rg-test-unit-001"
    error_message = "Resource group name did not match expected value"
  }

  assert {
    condition     = azurerm_resource_group.rg.location == "eastus2"
    error_message = "Resource group location did not match expected value"
  }

  assert {
    condition     = length(azurerm_management_lock.rg_lock) == 1
    error_message = "Management lock should have been planned when lock_level is provided"
  }
}

run "verify_without_lock" {
  command = plan

  variables {
    name     = "rg-test-unit-nolock"
    location = "eastus2"
  }

  assert {
    condition     = length(azurerm_management_lock.rg_lock) == 0
    error_message = "Management lock should not be planned when lock_level is null"
  }
}
