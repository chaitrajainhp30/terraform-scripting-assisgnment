terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.25.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7.2"
    }
  }
}

resource "random_id" "hex_suffix" {
  byte_length = 4
}

resource "docker_volume" "user_volume" {
  name = "${var.user_name}_volume"
}


resource "docker_network" "custom_network" {
  name = var.custom_network
}


resource "docker_container" "app_container" {
  name  = "instance_${random_id.hex_suffix.hex}"
  image = var.base_image

  ports {
    internal = var.container_port
    external = var.host_port
  }

  volumes {
    volume_name    = docker_volume.user_volume.name
    container_path = "/data"
  }

  networks_advanced {
    name = docker_network.custom_network.name
  }
  
  command = ["tail", "-f", "/dev/null"]
  
  depends_on = [
    docker_volume.user_volume,
    docker_network.custom_network
  ]
}