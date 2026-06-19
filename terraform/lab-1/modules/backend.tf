terraform {
  backend "local" {
    path = "estado_seguro/terraform.tfstate"
  }
}

# Por último este archivo nos da la pauta del estado de terraform, así como si decidimos destruir todo
# lo que hemos creado, este archivo es el mapa para terraform vaya por los archivos sin dañar el resto del proyecto

