terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "docker" {}

module "mi_servidor_dev" {
  source          = "../modules/contenedor_web"
  entorno         = "dev"
  nombre_proyecto = "app-modular"
}