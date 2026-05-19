terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# 1. Creamos una RED privada y aislada en Docker (El callejón privado)
resource "docker_network" "red_privada" {
  name = "red-segura-miriam"
}

# 2. Descargamos la imagen de Debian
resource "docker_image" "debian_img" {
  name         = "debian:stable-slim"
  keep_locally = false
}

# 3. Creamos el contenedor conectado a esa red
resource "docker_container" "servidor_hibrido" {
  image   = docker_image.debian_img.image_id
  name    = "servidor-hibrido-devops"
  command = ["tail", "-f", "/dev/null"]
  
  # Lo metemos dentro de la red que creamos arriba
  networks_advanced {
    name = docker_network.red_privada.name
  }

  # 🧙‍♂️ EL CONJURO MÁGICO: En cuanto el contenedor esté VIVO, Terraform ejecutará Ansible por ti
  provisioner "local-exec" {
    command = "sleep 3 && ansible-playbook -i hosts_hibrido.ini playbook_hibrido.yml"
  }
}