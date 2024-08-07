resource "azurerm_resource_group" "rg" {
  name     = local.resourceGroupName
  location = var.location
  tags = {
    siteId = "${var.siteId}"
  }
}

module "hci0-provisioners" {
  source                 = "../hci-provisioners"
  depends_on             = [azurerm_resource_group.rg]
  count                  = var.enableProvisioners ? 1 : 0
  resourceGroup          = azurerm_resource_group.rg
  siteId                 = var.siteId
  domainFqdn             = var.domainFqdn
  adouPath               = local.adouPath
  domainServerIP         = var.domainServerIP
  authenticationMethod   = var.authenticationMethod
  servers                = var.hci0Servers
  clusterName            = local.hci0ClusterName
  subscriptionId         = var.subscriptionId
  localAdminUser         = var.localAdminUser
  localAdminPassword     = var.localAdminPassword
  domainAdminUser        = var.domainAdminUser
  domainAdminPassword    = var.domainAdminPassword
  deploymentUser         = local.hci0DeploymentUserName
  deploymentUserPassword = var.deploymentUserPassword
  servicePrincipalId     = var.servicePrincipalId
  servicePrincipalSecret = var.servicePrincipalSecret
  destory_adou           = var.destory_adou
  virtualHostIp          = var.hci0VirtualHostIp
  dcPort                 = var.dcPort
  serverPorts            = var.serverPorts
}

module "hci0" {
  source                        = "../hci"
  depends_on                    = [module.hci0-provisioners]
  resourceGroup                 = azurerm_resource_group.rg
  siteId                        = var.siteId
  domainFqdn                    = var.domainFqdn
  startingAddress               = var.hci0StartingAddress
  endingAddress                 = var.hci0EndingAddress
  defaultGateway                = var.hci0DefaultGateway
  dnsServers                    = var.hci0DnsServers
  adouPath                      = local.adouPath
  servers                       = var.hci0Servers
  managementAdapters            = var.managementAdapters
  storageNetworks               = var.storageNetworks
  rdmaEnabled                   = var.rdmaEnabled
  storageConnectivitySwitchless = var.storageConnectivitySwitchless
  clusterName                   = local.hci0ClusterName
  customLocationName            = local.hci0CustomLocationName
  witnessStorageAccountName     = local.hci0WitnessStorageAccountName
  keyvaultName                  = local.hci0KeyvaultName
  randomSuffix                  = local.randomSuffix
  subscriptionId                = var.subscriptionId
  deploymentUser                = local.hci0DeploymentUserName
  deploymentUserPassword        = var.deploymentUserPassword
  localAdminUser                = var.localAdminUser
  localAdminPassword            = var.localAdminPassword
  servicePrincipalId            = var.servicePrincipalId
  servicePrincipalSecret        = var.servicePrincipalSecret
  rpServicePrincipalObjectId    = var.rpServicePrincipalObjectId
  isExported                    = var.isExported
}

locals {
  hci0ServerNames = [for server in var.hci0Servers : server.name]
}

module "hci0-extensions" {
  source                     = "../hci-extensions"
  depends_on                 = [module.hci0]
  resourceGroup              = azurerm_resource_group.rg
  siteId                     = var.siteId
  arcSettingsId              = module.hci0.arcSettings.id
  serverNames                = local.hci0ServerNames
  workspaceName              = local.workspaceName
  dataCollectionEndpointName = local.dataCollectionEndpointName
  dataCollectionRuleName     = local.dataCollectionRuleName
  enableInsights             = var.enableInsights
  enableAlerts               = var.enableAlerts
}

module "hci0-logical-network0" {
  source             = "../hci-logical-network"
  depends_on         = [module.hci0]
  resourceGroupId    = azurerm_resource_group.rg.id
  location           = azurerm_resource_group.rg.location
  customLocationId   = module.hci0.customlocation.id
  logicalNetworkName = local.lnet0-logicalNetworkName
  vmSwitchName       = module.hci0.vSwitchName
  startingAddress    = var.lnet0-startingAddress
  endingAddress      = var.lnet0-endingAddress
  defaultGateway     = var.hci0DefaultGateway
  dnsServers         = var.hci0DnsServers
  addressPrefix      = var.lnet0-addressPrefix
  vlanId             = var.lnet0-vlanId
}

module "hci0-aksarc0" {
  source                  = "../aks-arc"
  depends_on              = [module.hci0]
  resourceGroup           = azurerm_resource_group.rg
  customLocationId        = module.hci0.customlocation.id
  logicalNetworkId        = module.hci0-logical-network0.logicalNetworkId
  arbId                   = module.hci0.arcbridge.id
  sshKeyVaultId           = module.hci0.keyvault.id
  agentPoolProfiles       = var.aksArc0-agentPoolProfiles
  controlPlaneIp          = var.aksArc0-controlPlaneIp
  aksArcName              = local.aksArc0Name
  kubernetesVersion       = var.aksArc0-kubernetesVersion
  controlPlaneCount       = var.aksArc0-controlPlaneCount
  controlPlaneVmSize      = var.aksArc0-controlPlaneVmSize
  enableAzureRBAC         = var.aksArc0-enableAzureRBAC
  rbacAdminGroupObjectIds = var.aksArc0-rbacAdminGroupObjectIds
  sshPublicKey            = var.aksArc0-sshPublicKey
  isExported              = var.isExported
}

