output "contenedor_id" {
  description = "El ID único del contenedor creado por Terraform"
  value       = docker_container.nginx_srv.id
}

output "url_de_acceso" {
  description = "La URL para probar el servidor en el navegador"
  value       = "http://localhost:${docker_container.nginx_srv.ports[0].external}"
}