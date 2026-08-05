### 🛠️ Lab 3: Infraestructura Modular con Terraform

**Objetivo:** Diseñar y estructurar código de Infraestructura como Código (IaC) aplicando principios de diseño modular, separación de responsabilidades e inyección de variables dinámicas.

#### 🏗️ Estructura del Laboratorio
- **`modules/network/`**: Módulo reutilizable que define la configuración y parámetros del segmento de red local.
- **`main.tf`**: Orquestador principal que instancía el módulo de red pasándole variables globales.
- **`variables.tf` & `outputs.tf`**: Interfaz de entrada/salida para parametrizar entornos (`dev`, `prod`) de forma limpia.

#### 🚀 Comandos Ejecutados
```bash
terraform init
terraform plan
terraform apply