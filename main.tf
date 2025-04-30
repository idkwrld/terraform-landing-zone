# Create VPCs
resource "huaweicloud_vpc" "vpcs" {
  for_each = { for idx, vpc in var.vpcs : idx => vpc }

  name = each.value.name
  cidr = each.value.cidr
}

# Create Subnets
resource "huaweicloud_vpc_subnet" "subnets" {
  for_each = { for idx, subnet in var.subnets : idx => subnet }

  name       = each.value.name
  cidr       = each.value.cidr
  gateway_ip = each.value.gateway_ip
  vpc_id     = huaweicloud_vpc.vpcs[each.value.vpc_index].id
}

# Create VPC Peering Connections
resource "huaweicloud_vpc_peering_connection" "peerings" {
  for_each = { for idx, peering in var.vpc_peerings : idx => peering }

  name        = each.value.name
  vpc_id      = huaweicloud_vpc.vpcs[each.value.vpc_index].id
  peer_vpc_id = huaweicloud_vpc.vpcs[each.value.peer_vpc_index].id
  region      = var.region
}

resource "huaweicloud_identity_user" "IAM" {
  for_each = { for idx, IAM in var.IAM: idx => IAM }
  name        = each.value.name
  description = each.value.description
  password    = each.value.password
}

# Crear Elastic IP para NAT Gateway si está habilitado
resource "huaweicloud_vpc_eip" "nat_eip" {
  for_each = { for idx, nat_eip in var.nat_eip: idx => nat_eip }
  
  bandwidth {
    name = each.value.name
    size = each.value.size
    share_type = each.value.share_type
  }

  publicip {
    type = each.value.type
  }
}

resource "huaweicloud_networking_secgroup" "secgroup" {
  for_each = { for idx, secgroup in var.secgroup : idx => secgroup }
  name        = each.value.name
  description = each.value.description
}

resource "huaweicloud_identity_group" "IAM_group" {
  for_each = { for idx, IAM_group in var.IAM_group: idx => IAM_group }
  name        = each.value.name
  description = each.value.description
}

resource "huaweicloud_organizations_account" "orga1"{
  for_each = { for idx, orga1 in var.orga1 : idx => orga1 }
  name  = each.value.name
  email = each.value.email
}

data "huaweicloud_vpn_gateway_availability_zones" "test" {
  flavor          = "professional1"
  attachment_type = "vpc"
}

