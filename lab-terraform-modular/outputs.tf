output "network_status_file" {
    value       = module.vpc_network.network_file_path
    description = "Ruta devuelta por el módulo de red"
}

output "applied_cidr" {
    value       = module.vpc_network.configured_cidr
    description = "CIDR aplicado en la infraestructura"
}