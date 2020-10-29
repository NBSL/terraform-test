output "region" {
  value       = var.region
  description = "region"
}

output "network_name" {
  value       = google_compute_network.vpc.name
  description = "Main VPC network name"
}

output "subnetwork_name" {
  value       = google_compute_subnetwork.subnet.name
  description = "VPC Subnetwork name"
}
