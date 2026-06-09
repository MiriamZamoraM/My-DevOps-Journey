terraform{
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "~> 3.0.1"
        }
    }
}

provider "docker" {}

resource "docker_network" "red_privada" {
    name = "red-privada"
}

resource "docker_image" "debian_img" {
    name = "debian:stable-slim"
    keep_locally = false
}

resource "docker_container" "servidor_hibrido"{
    image = docker_image.debian_img.image_id
    name = "servidor-hibrido-devops"
    command = ["tail", "-f", "dev/null"]
    networks_advanced {
        name = docker_network.red_privada.name
    }
}