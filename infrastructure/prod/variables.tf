variable "entorno" {
  description = "El entorno de despliegue (dev, staging, prod)"
  type        = string
  default     = "prod"
}

variable "nombre_proyecto" {
  description = "Nombre del proyecto SRE corporativo"
  type        = string
  default     = "mi-app-sre-pro"
}