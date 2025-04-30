# Módulo de Networking
module "networking" {
  source = "./modules/networking"

  vpcs         = var.vpcs
  subnets      = var.subnets
  vpc_peerings = var.vpc_peerings
}

# Módulo de Security
module "security" {
  source = "./modules/security"

  secgroups = var.secgroup
}

# Módulo de IAM
module "iam" {
  source = "./modules/iam"

  users                = var.IAM
  groups               = var.IAM_group
  organization_accounts = var.orga1
}

# Módulo de EIP
module "eip" {
  source = "./modules/eip"

  eips = var.nat_eip
}