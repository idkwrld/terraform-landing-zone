### CREDENTIALS ###
terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">= 1.40.0"
    }
  }
}
provider "huaweicloud" {
  region = "la-north-2"
  access_key = "HPUABUODWRS340JJQMSY"
  secret_key = "BhAOmzZuQQxXvft4k1sX65pwhAGAAbIQQG6tUqgn"
}
