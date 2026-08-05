variable "app_environment" {
    type        = string
    description = "Entorno donde se desplegará la infraestructura"
    default     = "dev"
}

variable "custom_cidr" {
    type        = string
    description = "CIDR personalizado para el ambiente"
    default     = "10.10.0.0/16"
}