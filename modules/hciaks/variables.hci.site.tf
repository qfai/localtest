
variable "hci0Servers" {
  type        = list(object({ name = string, ipv4Address = string }))
  description = "A list of servers with their names and IPv4 addresses."
}

variable "hci0StartingAddress" {
  type        = string
  description = "The starting IP address of the IP pool."
}

variable "hci0EndingAddress" {
  type        = string
  description = "The ending IP address of the IP pool."
}
