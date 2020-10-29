output "domain" {
  value = var.domain
}

output "project_id" {
  value = var.project_id
}

output "kubeconfig_path" {
  value = abspath(local_file.kubeconfig.filename)
}
