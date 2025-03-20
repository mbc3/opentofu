output "loki_container_password" {
  value     = random_password.loki_container_password.result
  sensitive = true
}

output "logs_container_password" {
  value     = random_password.logs_container_password.result
  sensitive = true
}

output "graphs_container_password" {
  value     = random_password.graphs_container_password.result
  sensitive = true
}
