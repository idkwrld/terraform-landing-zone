output "vpc_ids" {
  description = "Map of VPC IDs created"
  value = { for k, v in huaweicloud_vpc.vpcs : k => v.id }
}

output "subnet_ids" {
  description = "Map of subnet IDs created"
  value = { for k, v in huaweicloud_vpc_subnet.subnets : k => v.id }
}

output "peering_ids" {
  description = "Map of VPC peering connection IDs created"
  value = { for k, v in huaweicloud_vpc_peering_connection.peerings : k => v.id }
}

# Opcional: para referencia, también puedes exportar los recursos completos
output "vpc_resources" {
  description = "Complete VPC resources created"
  value = huaweicloud_vpc.vpcs
}

output "subnet_resources" {
  description = "Complete subnet resources created"
  value = huaweicloud_vpc_subnet.subnets
}