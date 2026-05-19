# 1. Definición de Providers y Versiones
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

# 2. Configuración del Provider
# En Linux, Terraform se comunica con el socket de Docker por defecto
provider "docker" {}

# 3. Definición de la Imagen (nginx:alpine)
resource "docker_image" "nginx_img" {
  name         = "nginx:alpine"
  keep_locally = false
}

# 4. Creación del Contenedor y Mapeo de Puertos
resource "docker_container" "nginx_container" {
  image = docker_image.nginx_img.image_id
  name  = "tutorial-terraform-miriam"
  
  ports {
    internal = 80
    external = 8080
  }
}