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


IAM = [
  {
    name        = "IAM-1"
    description = "IAM user 1"
    password    = "paSsword1*"
  },
  {
    name        = "IAM-2"
    description = "IAM user 2"
    password    = "paSsword2*"
  },
  {
    name        = "IAM-3"
    description = "IAM user 3"
    password    = "paSsword3*"
  }
]

nat_eip = [
  {
    name = "nat-eip-1"
    size = 5
    share_type = "PER"
    type = "5_bgp"
  },
  {
    name = "nat-eip-2"
    size = 10
    share_type = "PER"
    type = "5_bgp"
  }
]

secgroup = [ {
  name        = "secgroup-1"
  description = "Security group 1"
},
{
  name        = "secgroup-2"
  description = "Security group 2"
},
{
  name        = "secgroup-3"
  description = "Security group 3"
}
]


IAM_group = [
  {
    name        = "IAM-group-1"
    description = "IAM group 1"
  },
  {
    name        = "IAM-group-2"
    description = "IAM group 2"
  },
  {
    name        = "IAM-group-3"
    description = "IAM group 3"
  }
]

orga1 = [{
  email = "puertasebastian096@gmail.com"
  name = "sebastian"
}]