terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "docker" {}

module "mi_servidor_prod" {
  source          = "../modules/contenedor_web"
  entorno         = "prod"
  nombre_proyecto = "app-modular"
}