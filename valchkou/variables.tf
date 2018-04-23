variable "region" {}
variable "ami" {
  type = "map"
  default = {
    "us-east-1" = "ami-1853ac65"
    "us-east-2" = "ami-25615740"
  }
}
variable "net" {
  type = "map"
  default = {
    "us-east-1" = "subnet-37ee1b50"
    "us-east-2" = "subnet-c1294ca9"
  }
}
