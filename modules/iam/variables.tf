variable "users" {
  description = "List of IAM users to create"
  type = list(object({
    name        = string
    description = string
    password    = string
  }))
  default = []
}

variable "groups" {
  description = "List of IAM groups to create"
  type = list(object({
    name        = string
    description = string
  }))
  default = []
}

variable "organization_accounts" {
  description = "List of organization accounts to create"
  type = list(object({
    name  = string
    email = string
  }))
  default = []
}