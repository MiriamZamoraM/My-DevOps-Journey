terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "debian_img_dev" {
  name         = "debian:stable-slim"
  keep_locally = false
}

resource "docker_container" "servidor_deb_dev" {
  image   = docker_image.debian_img_dev.image_id
  name    = "servidor-desarrollo-miriam"
  command = ["tail", "-f", "/dev/null"]
}