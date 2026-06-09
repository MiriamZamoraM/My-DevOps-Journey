terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "3.0.0"
        }
    }
}

provider "docker" {}

resource "docker_network" "mi_red" {
    name = "mi_red"
}

resource "docker_image" "django_img"{
    name = "python:3.10-slim"
    keep_locally = false
}

resource "docker_container" "django_container"{
    name = "django"
    image = docker_image.django_img.image_id
    command = ["tail", "-f", "/dev/null"]
    # Si ya tuvieramos el proyecto de Django, usariamos el comando:
    # command = ["python", "manage.py", "runserver", "0.0.0.0:8000"]
    networks_advanced {
        name = docker_network.mi_red.name
    }
    ports {
        internal = 8000
        external = 8000
    }
}