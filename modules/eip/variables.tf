variable "eips" {
  description = "List of Elastic IPs to create"
  type = list(object({
    name       = string
    size       = number
    share_type = string
    type       = string
  }))
  default = []
}