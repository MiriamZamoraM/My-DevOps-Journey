terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

# Simulamos el aprovisionamiento de una configuración de red
resource "local_file" "network_config" {
  content  = "VPC_ENV=${var.environment}\nSUBNET_CIDR=${var.subnet_cidr}\nSTATUS=provisioned"
  filename = "${path.module}/network_info.txt"
}
