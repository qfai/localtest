
variable "aksArc0-kubernetesVersion" {
  type        = string
  description = "The version of Kubernetes to use for the provisioned cluster."
  default     = "1.28.5"
}

variable "aksArc0-controlPlaneCount" {
  type        = number
  description = "The number of control plane nodes for the Kubernetes cluster."
  default     = 1
}

variable "aksArc0-controlPlaneVmSize" {
  type        = string
  description = "The size of the Virtual Machines to use for the control plane nodes."
  default     = "Standard_A4_v2"
}

variable "aksArc0-agentPoolProfiles" {
  type = list(object({
    count             = number
    enableAutoScaling = optional(bool)
    nodeTaints        = optional(list(string))
    nodeLabels        = optional(map(string))
    maxPods           = optional(number)
    name              = optional(string)
    osSKU             = optional(string, "CBLMariner")
    osType            = optional(string, "Linux")
    vmSize            = optional(string, "Standard_A4_v2")
  }))
  description = "The agent pool profiles for the Kubernetes cluster."
  default = [{
    count  = 1
    name   = "nodepool1"
    osSKU  = "CBLMariner"
    osType = "Linux"
    vmSize = "Standard_A4_v2"
  }]
}

variable "aksArc0-enableAzureRBAC" {
  type        = bool
  description = "Whether to enable Azure RBAC for the Kubernetes cluster."
  default     = true
}

variable "aksArc0-rbacAdminGroupObjectIds" {
  type        = list(string)
  description = "The object id of the Azure AD group that will be assigned the 'cluster-admin' role in the Kubernetes cluster."
  default     = ["ed888f99-66c1-48fe-992f-030f49ba50ed"]
}

variable "aksArc0-sshPublicKey" {
  type        = string
  description = "The SSH public key that will be used to access the kubernetes cluster nodes. If not specified, a new SSH key pair will be generated."
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC4gNijI3RyyJFEybNGPByc+NsJ1KbJLJ5jQ5mlHBnhYlaejb8x2bm/K+osJ+W6GK1q9ppYmYRqtSUPvv3qHq19cCNenQSTeaHWlzjQhALXXZfl2APIYtAedS7w+pqg/QTqJtX7kW1PxLWObKEj2fTX6YFA3tlEMn9SfHpWI6Z4acZa+3cB8v6hBWs8UY0vxxVeDdp4C9IFAmv9BH1HTJlr73wAy02JFTT1nNOnM19pQHMhBlnICOF0/2gVos7ffhpg1PAPqbPPvnCxB0h/GQFd7N83yIMP0XK1ptQ3znG9YvOL3a5R/jGVaoXy/UHMUWQKw6mRf0DHqhC16RjvpZGm5M8+Lu7jPX6Yuo44tO5nlmy1r+WbsmLrcrB3SWgVIZY1kokPem2HpEayl+hvUPd1DD02OjT5VO/WPPD59OCkTssxRasnkct605hIAy+5neRORGpgGIDj2XKgsGh+wsZF9HQdNOSWpKoGyy9RtRf7oX68Jf9xzxGZ6efnlh6uE/oDNJD+IlMSS1pdC9wN9+U7jR5rFs0FyFfYyZVx/r+0ecWt14WMdAOEhPcPWmQbs7RSMNn6WOv7OKg4aqWzoS1WMXG7KBh8xu2yj6SCVxRq6EAqrlFVGx4+fkAOUudGdKUrofGTUqmop20rL2Ct+FOJJjyxTO2lmxmQRCnAMWvg2Q==\n"
}
