module "vpc_network" {
    source = "./modules/network"

    # Le pasamos nuestras variables dinámicas al módulo
    environment = var.app_environment
    subnet_cidr = var.custom_cidr
}