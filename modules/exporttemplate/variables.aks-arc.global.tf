
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
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDnBuTbECXZY7ftGalWo5FY98x5k9jqiBbZVPlzi2nk61CCRG5rKMK8JU0mnWJ/XCbKCTaH7vdgYdZcTWvuCfmth/lr59W0FiJvyG8srJVc5miKWI38jgJZLKn3egYFA+JmyQl1aCynpS69NvgBvkrre9jd3GZm1OAyoydjXBJ+34dz9HE6IB4VfoWgEzIOOz5r8fmXhW5Cr7ZQbcqqYMkYCGXoS3In0JYAB23cUHYv1LEn08BZNSCWWSx972DcoCuf35bVQZ3FP0XRNCdzuNtMHkfOcvXfZ1F+6aUII9HdOYcL7mVtazJiee9e09Vdpz3zUp2x0lux7jY11phduaL/uy3VkJvfVys5t2kG0yZU/STYoTiJfH/GxdEfCoaof5PMVijX2SnNfsqPqRLa2yG+SvYpJEh9zNOCufGeLxcuboto7RH0dWlQlLnlPDM59JbVp9DtQte28iEGrZCKNDbQdc3EJQSMdB3JeZ+Wh97t4UVa36CcBU0ACISkNIhoVPWK1QPl9ZtWj5Q1La1qRbDvEQqiTrx4WlpqVfSgRKpqB3PUcsuHxBtLxk6rVvkza1bWud6bOHIZ+Xj7CUUaufF72sK+9LM0Mug1O/7oTBhFk8LiQtzd48cwTCJeRJKAj0NNM174/g7Yqpaq5iV3NMAz0s+z/ScBG6f5T+FWGoq31w==\n"
}
