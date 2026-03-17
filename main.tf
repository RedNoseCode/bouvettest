import {
  to = module.github_runners.module.runners.azurerm_resource_group.this[0]
  id = "/subscriptions/${var.subscription_id}/resourceGroups/rg-runner-poc-bvt"
}

import {
  to = module.github_runners.module.runners.azurerm_container_registry.acr
  id = "/subscriptions/${var.subscription_id}/resourceGroups/rg-runner-poc-bvt/providers/Microsoft.ContainerRegistry/registries/crrunnerpocbvt"
}

import {
  to = module.github_runners.module.runners.azurerm_key_vault.kv
  id = "/subscriptions/${var.subscription_id}/resourceGroups/rg-runner-poc-bvt/providers/Microsoft.KeyVault/vaults/kv-runner-poc-bvt"
}

import {
  to = module.github_runners.module.runners.azurerm_servicebus_namespace.scaler
  id = "/subscriptions/${var.subscription_id}/resourceGroups/rg-runner-poc-bvt/providers/Microsoft.ServiceBus/namespaces/sbns-runner-poc-bvt"
}

import {
  to = module.github_runners.module.runners.azurerm_storage_account.functions
  id = "/subscriptions/${var.subscription_id}/resourceGroups/rg-runner-poc-bvt/providers/Microsoft.Storage/storageAccounts/stfnrunnerpocbvt"
}

module "github_runners" {
  source = "github.com/patrickthor/github-runners?ref=v3.0.0"

  subscription_id = var.subscription_id
  workload        = var.workload
  environment     = var.environment
  instance        = var.instance
  location        = var.location
  github_org      = var.github_org
  github_repo     = var.github_repo

  runner_workload_roles = var.runner_workload_roles

  github_app_id_secret_name             = var.github_app_id_secret_name
  github_app_installation_id_secret_name = var.github_app_installation_id_secret_name
  github_app_private_key_secret_name    = var.github_app_private_key_secret_name
}

output "acr_login_server" {
  value = module.github_runners.acr_login_server
}

output "function_app_name" {
  value = module.github_runners.function_app_name
}

output "resource_group_name" {
  value = module.github_runners.resource_group_name
}
