variable "region" {
  type    = string
  default = "la-north-2"
}

variable "access_key" {
  type      = string
  sensitive = true
}

variable "secret_key" {
  type      = string
  sensitive = true
}

variable "vpcs" {
  type = list(object({
    name = string
    cidr = string
  }))
}

variable "subnets" {
  type = list(object({
    name       = string
    cidr       = string
    gateway_ip = string
    vpc_index  = number
  }))
}

variable "vpc_peerings" {
  type = map(object({
    name            = string
    vpc_index      = string
    peer_vpc_index = string
  }))
}

variable "IAM" {
  type = list(object({
    name        = string
    description = string
    password    = string
  }))
}

variable "nat_eip" {
  type = list(object({
    name       = string
    size       = number
    share_type = string
    type       = string
  }))
}

variable "IAM_group" {
  type = list(object({
    name        = string
    description = string
  }))
}

variable "secgroup" {
  type = list(object({
    name        = string
    description = string
  }))
}

variable "orga1" {
  type = list(object({
    name  = string
    email = string
  }))
}