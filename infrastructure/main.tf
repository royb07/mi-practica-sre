terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

# Configura el proveedor de Docker para que hable con tu Docker Desktop
provider "docker" {}

# 1. Le decimos a Terraform que se descargue la imagen oficial de Nginx
resource "docker_image" "nginx_img" {
  name         = "nginx:latest"
  keep_locally = false
}

# 2. Le decimos que encienda el contenedor usando esa imagen
resource "docker_container" "nginx_srv" {
  image = docker_image.nginx_img.image_id
  name  = "servidor-${var.nombre_proyecto}-${var.entorno}"
  
  ports {
    internal = 80
    external = var.entorno == "prod" ? 8081 : 8080 # Si es prod usa el 8081, si no el 8080
  }
}