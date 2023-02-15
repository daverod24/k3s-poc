terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.11.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "2.9.0"
    }
  }
}

provider "kubernetes" {
  # Configuración del proveedor de Kubernetes
  config_path    = "/etc/rancher/k3s/k3s.yaml"
  # todo
  # change permission this file to access /etc/rancher/k3s/k3s.yaml with chown
}

provider "helm" {
  kubernetes {
    config_path = "/etc/rancher/k3s/k3s.yaml"
  }

  # # localhost registry with password protection
  # registry {
  #   url = "oci://localhost:5000"
  #   username = "username"
  #   password = "password"
  # }

  # # private registry
  # registry {
  #   url = "oci://private.registry"
  #   username = "username"
  #   password = "password"
  # }
}



resource "kubernetes_namespace" "testing" {
  metadata {
    name = "testing"
  }
}





# Configuración de proveedor
# provider "kubernetes" {
#   config_context_cluster = "k3s-default" # Nombre del cluster K3s
# }

# # Configuración de recurso
# resource "kubernetes_namespace" "example_namespace" {
#   metadata {
#     name = "default" # Nombre del namespace
#   }
# }

# # Otros recursos de Kubernetes
# # ...

# # Configuración de proveedor de infraestructura local de K3s
# provider "k3s" {
#   # Configuración de la ruta al ejecutable K3s en el sistema
#   k3s_path = "/usr/local/bin/k3s"

#   # Otras configuraciones del proveedor K3s
#   # ...
# }

# # Recursos de proveedor de infraestructura local de K3s
# # resource "k3s_manifest" "example_deployment" {
# #   content = file("example_deployment.yaml") # Ruta al archivo YAML de la implementación

# #   # Otras configuraciones de la implementación
# #   # ...
# # }

# # Otros recursos de K3s
# # ...