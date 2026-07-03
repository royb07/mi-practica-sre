# 1. Definimos qué proveedor vamos a usar (en este caso, el sistema de archivos local)
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

# 2. Declaramos el recurso que queremos que Terraform administre
resource "local_file" "infra_status" {
  filename = "${path.module}/estado_servidor.txt"
  content  = "Servidor SRE inicializado con éxito. Estado: OPERATIVO. Proyecto del futuro papá en marcha.🚀"
}