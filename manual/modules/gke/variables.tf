
variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "region" {
  default     = "us-central1"
  description = "GKE Region"
}

variable "gke_num_nodes" {
  default     = 3
  description = "number of gke nodes"
}
variable "project_id" {
  description = "The name of the project in google"
}

variable "gke_network" {}
variable "gke_subnetwork" {}
