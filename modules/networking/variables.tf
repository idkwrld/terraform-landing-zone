variable "vpcs" {
  description = "List of VPCs to create"
  type = list(object({
    name = string
    cidr = string
  }))
}

variable "subnets" {
  description = "List of subnets to create"
  type = list(object({
    name       = string
    cidr       = string
    gateway_ip = string
    vpc_index  = number
  }))
}

variable "vpc_peerings" {
  description = "Map of VPC peering connections to create"
  type = map(object({
    name           = string
    vpc_index      = string
    peer_vpc_index = string
  }))
  default = {}
}