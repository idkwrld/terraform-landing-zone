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
  access_key = "W9OWRUUZPDS4AXXA1XQW"
  secret_key = "yyOJpfHj7w3OrD8zciyBRfkKdvg9SS0a3zQGt6ss"
}
