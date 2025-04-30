# Elastic IPs for NAT Gateway
resource "huaweicloud_vpc_eip" "eips" {
  for_each = { for idx, eip in var.eips : idx => eip }
  
  bandwidth {
    name       = each.value.name
    size       = each.value.size
    share_type = each.value.share_type
  }

  publicip {
    type = each.value.type
  }
}