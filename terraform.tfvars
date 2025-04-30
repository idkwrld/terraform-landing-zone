region = "la-north-2"
access_key = "W9OWRUUZPDS4AXXA1XQW"
secret_key = "yyOJpfHj7w3OrD8zciyBRfkKdvg9SS0a3zQGt6ss"

vpcs = [
  {
    name = "vpc-1"
    cidr = "192.168.0.0/16"
  },
  {
    name = "vpc-2"
    cidr = "10.0.0.0/16"
  },
  {
    name = "vpc-3"
    cidr = "172.16.0.0/16"
  }
]

subnets = [
  {
    name       = "subnet-1"
    cidr       = "192.168.1.0/24"
    gateway_ip = "192.168.1.1"
    vpc_index  = 0
  },
  {
    name       = "subnet-2"
    cidr       = "10.0.1.0/24"
    gateway_ip = "10.0.1.1"
    vpc_index  = 1
  },
  {
    name       = "subnet-3"
    cidr       = "172.16.0.0/24"
    gateway_ip = "172.16.0.1"
    vpc_index  = 2
  },
  {
    name       = "subnet-4"
    cidr       = "172.16.1.0/24"
    gateway_ip = "172.16.1.1"
    vpc_index  = 2
  }
]

vpc_peerings = {
  "peering1" = {
    name            = "vpc-peering-1"
    vpc_index      = "0"   # Index of the first VPC in the `vpcs` variable
    peer_vpc_index = "1"   # Index of the second VPC in the `vpcs` variable
  },
  "peering2" = {
    name            = "vpc-peering-2"
    vpc_index      = "1"
    peer_vpc_index = "2"
  }
}
