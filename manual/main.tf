provider "google" {
  project = var.project_id
  region  = var.region
}

provider "google-beta" {

  project = var.project_id
  region  = var.region
}

terraform {
  backend "gcs" {
    bucket = "terraform-0x32312-test-state"
    prefix = "terraform/state"
  }
}
module "vpc" {
  source = "./modules/vpc"

  project_id = var.project_id
  region     = var.region
}
module "gke" {
  source = "./modules/gke"

  project_id     = var.project_id
  region         = var.region
  gke_username   = var.username
  gke_password   = var.password
  gke_num_nodes  = var.num_nodes
  gke_network    = module.vpc.network_name
  gke_subnetwork = module.vpc.subnetwork_name
}

data "template_file" "kubeconfig" {
  template = file("${path.module}/kubeconfig-template.yaml")

  vars = {
    cluster_name    = module.gke.kubernetes_cluster_name
    user_name       = module.gke.kubernetes_cluster_username
    user_password   = module.gke.kubernetes_cluster_password
    endpoint        = module.gke.kubernetes_cluster_endpoint
    cluster_ca      = module.gke.kubernetes_cluster_ca
    client_cert     = module.gke.kubernetes_cluster_client_cert
    client_cert_key = module.gke.kubernetes_cluster_client_cert_key
  }
}

resource "local_file" "kubeconfig" {
  content  = data.template_file.kubeconfig.rendered
  filename = "${path.module}/kubeconfig"
}
