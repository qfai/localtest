locals {
  resourceGroupName             = "${var.siteId}-rg"
  hci0ClusterName               = "${var.siteId}-cl"
  hci0DeploymentUserName        = "${var.siteId}deploy"
  hci0CustomLocationName        = "${var.siteId}-customlocation"
  hci0KeyvaultName              = "${var.siteId}-kv"
  hci0WitnessStorageAccountName = "${var.siteId}wit"
  randomSuffix                  = true
  adouPath                      = "OU=${var.siteId}${var.adouSuffix}"
  workspaceName                 = "${var.siteId}-workspace"
  dataCollectionEndpointName    = "${var.siteId}-dce"
  dataCollectionRuleName        = "AzureStackHCI-${var.siteId}-dcr"
  lnet0-logicalNetworkName      = "${var.siteId}-logicalnetwork"
  aksArc0Name                   = "${var.siteId}-aksArc"
}
