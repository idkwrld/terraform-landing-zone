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

# Crear Elastic IP para NAT Gateway si está habilitado
resource "huaweicloud_vpc_eip" "nat_eip" {
  count = var.enable_nat_gateway ? 1 : 0

  bandwidth {
    name = "nat-eip-bandwidth"
    size = 5
    share_type = "PER"
  }

  publicip {
    type = "5_bgp"
  }
}

# Crear NAT Gateway si el usuario lo solicita
resource "huaweicloud_nat_gateway" "nat" {
  count = var.enable_nat_gateway ? 1 : 0

  name      = "nat-gateway"
  vpc_id    = huaweicloud_vpc.vpcs[0].id  # Primera VPC, ajustable
  spec      = 1
  subnet_id = huaweicloud_vpc_subnet.subnets[0].id
}

# Asociar NAT Gateway con EIP
resource "huaweicloud_nat_snat_rule" "snat" {
  count = var.enable_nat_gateway ? 1 : 0

  nat_gateway_id = huaweicloud_nat_gateway.nat[0].id
  floating_ip_id = huaweicloud_vpc_eip.nat_eip[0].id
  subnet_id      = huaweicloud_vpc_subnet.subnets[0].id
}

resource "huaweicloud_ces_alarm_template" "test"{
  name = "Test"

  policies {
    namespace           = "SYS.APIG"
    dimension_name      = "api_id"
    metric_name         = "req_count_2xx"
    period              = 1
    filter              = "average"
    comparison_operator = ">="
    value               = "10"
    unit                = "times/minute"
    count               = 3
    alarm_level         = 2
    suppress_duration   = 43200
  }
}
resource "huaweicloud_lts_group" "log_group1" {
  group_name  = "log_group1"
  ttl_in_days = 30
}
resource "huaweicloud_lts_group" "test_group" {
  group_name  = "test_group"
  ttl_in_days = 1
}

resource "huaweicloud_lts_stream" "test_stream" {
  group_id    = huaweicloud_lts_group.test_group.id
  stream_name = "testacc_stream"
}
