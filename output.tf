output "container_ip" {
  description = "IP address of the Docker container"
  value       = docker_container.app_container.network_data[0].ip_address
  depends_on  = [docker_container.app_container]
}