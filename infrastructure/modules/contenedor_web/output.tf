output "puerto_contenedor" {
  value = docker_container.nginx_srv.ports[0].external
}