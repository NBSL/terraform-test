variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "zone" {
  type    = string
  default = "europe-north1-a"
}

variable "domain" {
  type        = string
  description = "Domain name in form of example.com"
}

variable "username" {}
variable "password" {}
variable "num_nodes" {}
