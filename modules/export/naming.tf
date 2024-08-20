locals {
  resourceGroupName             = "${var.siteId}5-rg"
  hci0ClusterName               = "${var.siteId}5-cl"
  hci0DeploymentUserName        = "${var.siteId}5deploy"
  hci0CustomLocationName        = "${var.siteId}5-customlocation"
  hci0KeyvaultName              = "${var.siteId}5-kv"
  hci0WitnessStorageAccountName = "${var.siteId}5wit"
  randomSuffix                  = true
  adouPath                      = "OU=${var.siteId}${var.adouSuffix}"
  workspaceName                 = "${var.siteId}5-workspace"
  dataCollectionEndpointName    = "${var.siteId}5-dce"
  dataCollectionRuleName        = "AzureStackHCI-${var.siteId}5-dcr"
  lnet0-logicalNetworkName      = "${var.siteId}5-logicalnetwork"
  aksArc0Name                   = "${var.siteId}5-aksArc"
}
