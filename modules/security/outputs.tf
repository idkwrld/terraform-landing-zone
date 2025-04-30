output "secgroup_ids" {
  description = "Map of security group IDs created"
  value = { for k, v in huaweicloud_networking_secgroup.secgroups : k => v.id }
}