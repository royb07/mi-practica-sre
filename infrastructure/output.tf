output "ruta_del_archivo" {
  description = "La ruta exacta donde se guardo la configuracion del servidor"
  value       = local_file.servidor_config.filename
}

output "mensaje_exito" {
  value = "¡Infraestructura de ${var.entorno} desplegada correctamente!"
}