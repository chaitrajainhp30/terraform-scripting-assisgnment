variable "base_image" {
  description = "Docker image to use (e.g., ubuntu or centos)"
  type        = string
}

variable "user_name" {
  description = "Your name to prefix the volume"
  type        = string
}

variable "container_port" {
  description = "Internal container port to expose"
  type        = number
  default     = 8080
}

variable "host_port" {
  description = "Host port to map to container port"
  type        = number
  default     = 25678
}

variable "custom_network" {
  description = "Network name"
  type = string
}