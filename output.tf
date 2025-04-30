output "vpc_ids" {
  description = "IDs of the VPCs created"
  value       = module.networking.vpc_ids
}

output "subnet_ids" {
  description = "IDs of the subnets created"
  value       = module.networking.subnet_ids
}

output "peering_ids" {
  description = "IDs of the VPC peering connections created"
  value       = module.networking.peering_ids
}

output "secgroup_ids" {
  description = "IDs of the security groups created"
  value       = module.security.secgroup_ids
}

output "user_ids" {
  description = "IDs of the IAM users created"
  value       = module.iam.user_ids
}

output "group_ids" {
  description = "IDs of the IAM groups created"
  value       = module.iam.group_ids
}

output "organization_account_ids" {
  description = "IDs of the organization accounts created"
  value       = module.iam.organization_account_ids
}

output "eip_ids" {
  description = "IDs of the Elastic IPs created"
  value       = module.eip.eip_ids
}

output "eip_addresses" {
  description = "Addresses of the Elastic IPs created"
  value       = module.eip.eip_addresses
}