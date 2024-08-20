locals {
  siteId = "b88a1611"
}

module "base" {
  source          = "../../modules/base"
  location        = "eastus"
  siteId          = local.siteId
  domainFqdn      = "jumpstart.local"
  startingAddress = "192.168.1.55"
  endingAddress   = "192.168.1.65"
  defaultGateway  = "192.168.1.1"
  dnsServers      = ["192.168.1.254"]
  adouSuffix      = "DC=jumpstart,DC=local"
  domainServerIP  = "192.168.1.254"
  servers = [
    {
      name        = "AzSHOST1",
      ipv4Address = "192.168.1.12"
    },
    {
      name        = "AzSHOST2",
      ipv4Address = "192.168.1.13"
    }
  ]
  managementAdapters = ["FABRIC", "FABRIC2"]
  storageNetworks = [
    {
      name               = "Storage1Network",
      networkAdapterName = "StorageA",
      vlanId             = "711"
    },
    {
      name               = "Storage2Network",
      networkAdapterName = "StorageB",
      vlanId             = "712"
    }
  ]
  // Beginning of specific varible for virtual environment
  dcPort = 6985
  serverPorts = {
    "AzSHOST1" = 15985,
    "AzSHOST2" = 25985
  }
  virtualHostIp = "10.0.0.1"
  // end of specific varible for virtual environment
  subscriptionId                = var.subscriptionId
  rdmaEnabled                   = false
  authenticationMethod          = "Credssp"
  storageConnectivitySwitchless = false
  deploymentUserPassword        = var.deploymentUserPassword
  domainAdminUser               = var.domainAdminUser
  domainAdminPassword           = var.domainAdminPassword
  localAdminUser                = var.localAdminUser
  localAdminPassword            = var.localAdminPassword
  servicePrincipalId            = var.servicePrincipalId
  servicePrincipalSecret        = var.servicePrincipalSecret
  rpServicePrincipalObjectId    = var.rpServicePrincipalObjectId

  // Enable extensions
  enableInsights = true
  enableAlerts   = true

  // Beginning of hybrid aks related parameters
  aksArc-controlPlaneIp   = "192.168.1.190"
  lnet-startingAddress    = "192.168.1.171"
  lnet-endingAddress      = "192.168.1.190"
  lnet-addressPrefix      = "192.168.1.0/24"
  lnet-defaultGateway     = "192.168.1.1"
  lnet-dnsServers         = ["192.168.1.254"]
  rbacAdminGroupObjectIds = ["ed888f99-66c1-48fe-992f-030f49ba50ed"]

  downloadWinServerImage = true
  vmAdminPassword        = var.vmAdminPassword
  domainJoinPassword     = var.domainJoinPassword

  country = "US"
}

