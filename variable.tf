variable "name" {
  type = string
  default = "consul-cluster1"
}

variable "rg" {
  type = string
  default = "rg-consul-cluster1"
}

variable "location" {
  type = string
  default = "West Europe"
}

variable "public_key" {}

variable "ssh_user" {}
