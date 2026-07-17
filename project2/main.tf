# Terraform solicita los proveedores
terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

# (DOCS): The provider also supports multiple paths in the same 
# way that kubectl does using the config_paths attribute 
# or KUBE_CONFIG_PATHS environment variable.
provider "kubernetes" {
  config_path = "~/.kube/config"
}


# Namespace para la aplicación
resource "kubernetes_namespace" "app" {
  metadata {
    name = "mi-aplicacion"
  }
}

# Deployment de Nginx, dónde estarán mis replicas y mi imagen base a utilizar
resource "kubernetes_deployment" "nginx" {
  metadata {
    name      = "nginx-deployment"
    namespace = kubernetes_namespace.app.metadata[0].name
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "nginx"
      }
    }
    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }
      spec {
        container {
          name  = "nginx"
          image = "nginx:1.14.2"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

# Servicio de Nginx, para exponer el Deployment hacia afuera, como un teléfono público para mi.
resource "kubernetes_service" "nginx_service" {
  metadata {
    name      = "nginx-service"
    namespace = kubernetes_namespace.app.metadata[0].name
  }
  spec {
    selector = {
      app = "nginx"
    }
    port {
      port        = 80
      target_port = 80
    }
    type = "NodePort"
  }
}