variable "secgroups" {
  description = "List of security groups to create"
  type = list(object({
    name        = string
    description = string
  }))
  default = []
}