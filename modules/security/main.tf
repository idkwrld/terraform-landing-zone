# Security Groups
resource "huaweicloud_networking_secgroup" "secgroups" {
  for_each = { for idx, secgroup in var.secgroups : idx => secgroup }
  
  name        = each.value.name
  description = each.value.description
}