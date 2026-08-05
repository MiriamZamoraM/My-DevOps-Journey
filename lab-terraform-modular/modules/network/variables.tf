variable "environment" {
    type        = string
    description = "Entorno de despliegue (dev, qa, prod)"
}

variable "subnet_cidr" {
    type        = string
    description = "Rango CIDR para la subred local"
    default     = "10.0.1.0/24"
}