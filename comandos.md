# 🦍 SRE Cheat Sheet - Manual de Supervivencia Local

## 🐋 1. El Mundo de los Contenedores (Docker)
* **Construir imagen:** `docker build -t mi-app-sre:v1 .`
* **Ver imágenes locales:** `docker images`
* **Correr contenedor suelto:** `docker run -d -p 3000:3000 mi-app-sre:v1`
* **Ver qué está corriendo:** `docker ps`

## ☸️ 2. El Orquestador (Kubernetes & Kubectl)
* **Aplicar/Actualizar cualquier archivo:** `kubectl apply -f <archivo.yaml>`
* **Ver el estado de la infraestructura:**
    * `kubectl get pods` (Los contenedores de las apps)
    * `kubectl get svc` (Los cables de red/balanceadores)
    * `kubectl get pvc` (Los discos duros de las DBs)
* **Inspeccionar errores (Logs):** `kubectl logs <nombre-del-pod>`
* **Túnel de red (Traer la app a la Mac):** `kubectl port-forward svc/<nombre-servicio> 8080:3000`

## ⚓ 3. El Administrador de Paquetes (Helm)
* **Ver qué instaló Helm:** `helm list -A`
* **Ver monitores de Prometheus activos:** `kubectl get servicemonitor -n monitoring`
* **Borrar una instalación:** `helm uninstall <nombre> -n <namespace>`