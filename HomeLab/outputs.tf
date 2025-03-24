output "logs_container_password" {
  value     = random_password.logs_container_password.result
  sensitive = true
}

output "graphs_container_password" {
  value     = random_password.graphs_container_password.result
  sensitive = true
}

output "test_container_password" {
  value     = random_password.test_container_password.result
  sensitive = true
}
