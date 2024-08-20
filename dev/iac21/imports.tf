
import {
  id = "/subscriptions/de3c4d5e-af08-451a-a873-438d86ab6f4b/resourceGroups/iac215-rg"
  to = module.base.azurerm_resource_group.rg
}

import {
  id = "/subscriptions/de3c4d5e-af08-451a-a873-438d86ab6f4b/resourceGroups/iac215-rg/providers/Microsoft.AzureStackHCI/clusters/iac215-cl?api-version=2023-08-01-preview"
  to = module.base.module.hci0.azapi_resource.cluster
}

import {
  id = "/subscriptions/de3c4d5e-af08-451a-a873-438d86ab6f4b/resourceGroups/iac215-rg/providers/Microsoft.AzureStackHCI/clusters/iac215-cl/deploymentSettings/default?api-version=2023-08-01-preview"
  to = module.base.module.hci0.azapi_resource.validatedeploymentsetting_seperate[0]
}

import {
  id = "/subscriptions/de3c4d5e-af08-451a-a873-438d86ab6f4b/resourceGroups/iac215-rg/providers/Microsoft.Storage/storageAccounts/iac215wit98"
  to = module.base.module.hci0.azurerm_storage_account.witness
}

import {
  id = "/subscriptions/de3c4d5e-af08-451a-a873-438d86ab6f4b/resourceGroups/iac215-rg/providers/Microsoft.KeyVault/vaults/iac215-kv-98"
  to = module.base.module.hci0.azurerm_key_vault.DeploymentKeyVault
}

import {
  id = "98,10,99"
  to = module.base.module.hci0.random_integer.random_suffix
}

import {
  id = "https://iac215-kv-98.vault.azure.net/secrets/AzureStackLCMUserCredential/6df6af6d1a6a4696bf3c9cf4ec17ef14"
  to = module.base.module.hci0.azurerm_key_vault_secret.AzureStackLCMUserCredential
}

import {
  id = "https://iac215-kv-98.vault.azure.net/secrets/LocalAdminCredential/10d0692fa0b14840aceaf54d9281c6f9"
  to = module.base.module.hci0.azurerm_key_vault_secret.LocalAdminCredential
}

import {
  id = "https://iac215-kv-98.vault.azure.net/secrets/DefaultARBApplication/c3d3128561e44ad59bed37c38c86d8ea"
  to = module.base.module.hci0.azurerm_key_vault_secret.DefaultARBApplication
}

import {
  id = "https://iac215-kv-98.vault.azure.net/secrets/WitnessStorageKey/c6076238bedc40c8893bc615980be1ea"
  to = module.base.module.hci0.azurerm_key_vault_secret.WitnessStorageKey
}

import {
  id = "/subscriptions/de3c4d5e-af08-451a-a873-438d86ab6f4b/resourceGroups/iac215-rg/providers/Microsoft.Authorization/roleAssignments/a3854b2a-c703-8a3b-5aa6-f395f15784af"
  to = module.base.module.hci0.azurerm_role_assignment.ServicePrincipalRoleAssign["ACMRM"]
}

import {
  id = "/subscriptions/de3c4d5e-af08-451a-a873-438d86ab6f4b/resourceGroups/iac215-rg/providers/Microsoft.Authorization/roleAssignments/98e428e5-04bd-e655-7465-70d77940fb92"
  to = module.base.module.hci0.module.serverRoleBindings["AzSHOST1"].azurerm_role_assignment.MachineRoleAssign["Reader"]
}

import {
  id = "/subscriptions/de3c4d5e-af08-451a-a873-438d86ab6f4b/resourceGroups/iac215-rg/providers/Microsoft.Authorization/roleAssignments/26bac880-08d9-d085-b3b9-5af8f62ad44a"
  to = module.base.module.hci0.module.serverRoleBindings["AzSHOST2"].azurerm_role_assignment.MachineRoleAssign["KVSU"]
}

import {
  id = "/subscriptions/de3c4d5e-af08-451a-a873-438d86ab6f4b/resourceGroups/iac215-rg/providers/Microsoft.Authorization/roleAssignments/482d77de-989f-ec27-3283-3aae15e0884c"
  to = module.base.module.hci0.module.serverRoleBindings["AzSHOST1"].azurerm_role_assignment.MachineRoleAssign["KVSU"]
}

import {
  id = "/subscriptions/de3c4d5e-af08-451a-a873-438d86ab6f4b/resourceGroups/iac215-rg/providers/Microsoft.Authorization/roleAssignments/8fe2e1b8-d517-6392-053f-c535d110bf61"
  to = module.base.module.hci0.module.serverRoleBindings["AzSHOST2"].azurerm_role_assignment.MachineRoleAssign["Reader"]
}

import {
  id = "/subscriptions/de3c4d5e-af08-451a-a873-438d86ab6f4b/resourceGroups/iac215-rg/providers/Microsoft.Authorization/roleAssignments/06cbbadc-8b3a-795c-230e-6d9dc45a3f41"
  to = module.base.module.hci0.module.serverRoleBindings["AzSHOST1"].azurerm_role_assignment.MachineRoleAssign["ASHDMR"]
}

import {
  id = "/subscriptions/de3c4d5e-af08-451a-a873-438d86ab6f4b/resourceGroups/iac215-rg/providers/Microsoft.Authorization/roleAssignments/8c3b24e9-5080-ab4c-4272-a06f84945a15"
  to = module.base.module.hci0.module.serverRoleBindings["AzSHOST2"].azurerm_role_assignment.MachineRoleAssign["ASHDMR"]
}

import {
  id = "/subscriptions/de3c4d5e-af08-451a-a873-438d86ab6f4b/resourceGroups/iac215-rg/providers/Microsoft.Authorization/roleAssignments/39132d09-68aa-7026-4143-df126bf33607"
  to = module.base.module.hci0.module.serverRoleBindings["AzSHOST1"].azurerm_role_assignment.MachineRoleAssign["ACMRM"]
}

import {
  id = "/subscriptions/de3c4d5e-af08-451a-a873-438d86ab6f4b/resourceGroups/iac215-rg/providers/Microsoft.Authorization/roleAssignments/0967b07f-c58a-3cf8-b1fe-45a5146a329b"
  to = module.base.module.hci0.module.serverRoleBindings["AzSHOST2"].azurerm_role_assignment.MachineRoleAssign["ACMRM"]
}

import {
  id = "/subscriptions/de3c4d5e-af08-451a-a873-438d86ab6f4b/resourceGroups/iac215-rg/providers/Microsoft.HybridCompute/machines/AzSHOST1/providers/Microsoft.Insights/dataCollectionRuleAssociations/DCRA_ecf107c2f7e26edce498053876db97d0"
  to = module.base.module.hci0-extensions.module.insights[0].azurerm_monitor_data_collection_rule_association.association["AzSHOST1"]
}

import {
  id = "/subscriptions/de3c4d5e-af08-451a-a873-438d86ab6f4b/resourceGroups/iac215-rg/providers/Microsoft.HybridCompute/machines/AzSHOST2/providers/Microsoft.Insights/dataCollectionRuleAssociations/DCRA_2a52ddbed443aa7480f64980568985c2"
  to = module.base.module.hci0-extensions.module.insights[0].azurerm_monitor_data_collection_rule_association.association["AzSHOST2"]
}

import {
  id = "/subscriptions/de3c4d5e-af08-451a-a873-438d86ab6f4b/resourceGroups/iac215-rg/providers/Microsoft.Insights/dataCollectionRules/AzureStackHCI-iac215-dcr"
  to = module.base.module.hci0-extensions.module.insights[0].azurerm_monitor_data_collection_rule.dcr
}

import {
  id = "/subscriptions/de3c4d5e-af08-451a-a873-438d86ab6f4b/resourceGroups/iac215-rg/providers/Microsoft.Insights/dataCollectionEndpoints/iac215-dce"
  to = module.base.module.hci0-extensions.module.insights[0].azurerm_monitor_data_collection_endpoint.dce
}

import {
  id = "/subscriptions/de3c4d5e-af08-451a-a873-438d86ab6f4b/resourceGroups/iac215-rg/providers/Microsoft.OperationalInsights/workspaces/iac215-workspace"
  to = module.base.module.hci0-extensions.module.insights[0].azurerm_log_analytics_workspace.workspace
}

import {
  id = "/subscriptions/de3c4d5e-af08-451a-a873-438d86ab6f4b/resourceGroups/iac215-rg/providers/Microsoft.AzureStackHCI/clusters/iac215-cl/ArcSettings/default/Extensions/AzureMonitorWindowsAgent?api-version=2023-08-01"
  to = module.base.module.hci0-extensions.module.insights[0].azapi_resource.monitor_agent
}

import {
  id = "/subscriptions/de3c4d5e-af08-451a-a873-438d86ab6f4b/resourceGroups/iac215-rg/providers/Microsoft.AzureStackHCI/clusters/iac215-cl/ArcSettings/default/Extensions/AzureEdgeAlerts?api-version=2023-08-01"
  to = module.base.module.hci0-extensions.azapi_resource.alerts[0]
}

import {
  id = "/subscriptions/de3c4d5e-af08-451a-a873-438d86ab6f4b/resourceGroups/iac215-rg/providers/Microsoft.AzureStackHCI/logicalNetworks/iac215-logicalnetwork?api-version=2023-09-01-preview"
  to = module.base.module.hci0-logical-network0.azapi_resource.logicalNetwork
}

import {
  id = "/subscriptions/de3c4d5e-af08-451a-a873-438d86ab6f4b/resourceGroups/iac215-rg/providers/Microsoft.Kubernetes/connectedClusters/iac215-aksArc?api-version=2024-01-01"
  to = module.base.module.hci0-aksarc0.azapi_resource.connectedCluster
}

import {
  id = "/subscriptions/de3c4d5e-af08-451a-a873-438d86ab6f4b/resourceGroups/iac215-rg/providers/Microsoft.Kubernetes/connectedClusters/iac215-aksArc/providers/Microsoft.HybridContainerService/provisionedClusterInstances/default"
  to = module.base.module.hci0-aksarc0.azapi_resource.provisionedClusterInstance
}
