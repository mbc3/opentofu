# output "test_container_password" {
#   value     = random_password.test_container_password.result
#   sensitive = true
# }

output "logs_container_password" {
  value     = random_password.logs_container_password.result
  sensitive = true
}

output "graphs_container_password" {
  value     = random_password.graphs_container_password.result
  sensitive = true
}

output "dns01_container_password" {
  value     = random_password.dns01_container_password.result
  sensitive = true
}

output "dns02_container_password" {
  value     = random_password.dns02_container_password.result
  sensitive = true
}

output "ca_container_password" {
  value     = random_password.ca_container_password.result
  sensitive = true
}
