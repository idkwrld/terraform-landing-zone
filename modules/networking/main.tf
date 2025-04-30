# VPCs
resource "huaweicloud_vpc" "vpcs" {
  for_each = { for idx, vpc in var.vpcs : idx => vpc }

  name = each.value.name
  cidr = each.value.cidr
}

# Subnets
resource "huaweicloud_vpc_subnet" "subnets" {
  for_each = { for idx, subnet in var.subnets : idx => subnet }

  name       = each.value.name
  cidr       = each.value.cidr
  gateway_ip = each.value.gateway_ip
  vpc_id     = huaweicloud_vpc.vpcs[each.value.vpc_index].id
}

# VPC Peering Connections
resource "huaweicloud_vpc_peering_connection" "peerings" {
  for_each = { for idx, peering in var.vpc_peerings : idx => peering }

  name        = each.value.name
  vpc_id      = huaweicloud_vpc.vpcs[each.value.vpc_index].id
  peer_vpc_id = huaweicloud_vpc.vpcs[each.value.peer_vpc_index].id
}