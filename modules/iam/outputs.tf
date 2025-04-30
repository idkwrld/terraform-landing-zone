output "user_ids" {
  description = "Map of IAM user IDs created"
  value = { for k, v in huaweicloud_identity_user.users : k => v.id }
}

output "group_ids" {
  description = "Map of IAM group IDs created"
  value = { for k, v in huaweicloud_identity_group.groups : k => v.id }
}

output "organization_account_ids" {
  description = "Map of organization account IDs created"
  value = { for k, v in huaweicloud_organizations_account.organization_accounts : k => v.id }
}