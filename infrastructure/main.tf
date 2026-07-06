terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "servidor_config" {
  filename = "${path.module}/config_${var.entorno}.json"
  content  = <<EOF
{
  "project": "${var.nombre_proyecto}",
  "environment": "${var.entorno}",
  "status": "OPERATIONAL",
  "build": "2026.07.06",
  "msg": "Motores encendidos y variables dominadas con exito."
}
EOF
}