variable "region" {
  type    = string
  default = "us-west-1"
}

variable "access_key" {
  type      = string
  sensitive = true
}

variable "secret_key" {
  type      = string
  sensitive = true
}

variable "vpcs" {
  type = list(object({
    name = string
    cidr = string
  }))
}

variable "subnets" {
  type = list(object({
    name       = string
    cidr       = string
    gateway_ip = string
    vpc_index  = number
  }))
}

variable "vpc_peerings" {
  type = map(object({
    name            = string
    vpc_index      = string
    peer_vpc_index = string
  }))
}
variable "enterprise_project_id" {
  description = "Enterprise Project ID for the VPN Gateway"
  type        = string
  default     = "0" # Default project if not specified
}

# ✅ Nueva variable para definir si se crea un NAT Gateway
variable "enable_nat_gateway" {
  description = "Indicates if a NAT Gateway should be created"
  type        = bool
}

variable "enable_cloud_eye" {
  description = "Indicates if a Cloud Eye service should be created"
  type        = bool
}
variable "enable_lts" {
  description = "Indicates if a Log Tank Service (LTS) should be created"
  type        = bool
}
