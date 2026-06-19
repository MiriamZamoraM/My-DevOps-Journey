module "mi_infraestructura" { # Aquí estamos creando el objeto desde el modulo de la carpeta de infra
  source  = "./modules/infra" # Le damos la ruta de los archivos originales
  entorno = var.ambiente_global # El valor de la variable de entorno elegida 
}
