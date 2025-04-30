output "eip_ids" {
  description = "Map of Elastic IP IDs created"
  value = { for k, v in huaweicloud_vpc_eip.eips : k => v.id }
}

output "eip_addresses" {
  description = "Map of Elastic IP addresses created"
  value = { for k, v in huaweicloud_vpc_eip.eips : k => v.address }
}