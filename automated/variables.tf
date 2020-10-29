variable "project" {}
variable "region" { default = "us-central1" }
variable "cluster_name" {}
variable "network" { default = "default" }
variable "subnetwork" { default = "" }
variable "ip_range_pods" { default = "" }
variable "ip_range_services" { default = "" }
variable "kubernetes_version" { default = "1.16.11-gke.5" }
