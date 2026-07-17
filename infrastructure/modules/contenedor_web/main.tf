terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

# 1. Descarga la imagen de Nginx
resource "docker_image" "nginx_img" {
  name         = "nginx:1.25.3-alpine"
  keep_locally = false
  force_remove = true #Permite eliminar la imagen o actualizarla sin que exista conflicto entre docker y Terraform porque hay varios ambientes (DEv y Prod) que lo estan usando
}

# 2. Crea el contenedor usando las variables
resource "docker_container" "nginx_srv" {
  image = docker_image.nginx_img.image_id
  name  = "servidor-${var.nombre_proyecto}-${var.entorno}"

  ports {
    internal = 80
    # Si es prod usa 8081, si no (dev) usa 8080
    external = var.entorno == "prod" ? 8081 : 8080
  }
}