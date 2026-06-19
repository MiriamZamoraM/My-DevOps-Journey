resource "local_file" "servidor_prod" { # Tipo de infraesturctura, en este caso local, 
                                        #si fuera de una empresa sería aws_instance o azurerm
  filename = "${path.module}/servidor_${var.entorno}.txt"
            # No importa desde donde se ejecute path.module va a referenciar a la carpeta donde se encuentra el main.tf
            # El nombre del archivo va a ser servidor_entorno.txt, por ejemplo servidor_prod.txt
  content  = "IP_Privada: 10.0.1.5\nEntorno: ${var.entorno}\nEstado: Configurado por Terraform"
}


# modules/infra/main.tf (Versión AWS simulada)
# resource "aws_instance" "servidor_django" {
#   ami           = "ami-0c55b159cbfafe1f0" # Imagen de Ubuntu Server
#   instance_type = var.entorno == "prod" ? "t3.medium" : "t2.micro" # Si es prod, dale más potencia
# 
#   tags = {
#     Name        = "servidor-django-${var.entorno}"
#     Environment = var.entorno
#   }
# }