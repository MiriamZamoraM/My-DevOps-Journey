output "network_file_path" {
    value       = local_file.network_config.filename
    description = "Ruta del archivo de configuración generado"
}

output "configured_cidr" {
    value       = var.subnet_cidr
    description = "CIDR asignado a la red"
}