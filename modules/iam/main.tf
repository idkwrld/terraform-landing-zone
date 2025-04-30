# IAM Users
resource "huaweicloud_identity_user" "users" {
  for_each = { for idx, user in var.users : idx => user }
  
  name        = each.value.name
  description = each.value.description
  password    = each.value.password
}

# IAM Groups
resource "huaweicloud_identity_group" "groups" {
  for_each = { for idx, group in var.groups : idx => group }
  
  name        = each.value.name
  description = each.value.description
}

# Organizations Account (if needed)
resource "huaweicloud_organizations_account" "organization_accounts" {
  for_each = { for idx, account in var.organization_accounts : idx => account }
  
  name  = each.value.name
  email = each.value.email
}