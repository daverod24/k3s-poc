resource "kubernetes_secret" "my-secret" {
  metadata {
    name = "my-secret"
  }

  data = {
    my-secret-key = filebase64("my-secret.yaml")
  }
}

resource "kubernetes_deployment" "my-deployment" {
  metadata {
    name = "my-deployment"
    labels = {
      app = "my-app"
    }
  }

  spec {
    selector {
      match_labels = {
        app = "my-app"
      }
    }

    replicas = 1

    template {
      metadata {
        labels = {
          app = "my-app"
        }
      }

      spec {
        container {
          name = "my-app"
          image = "kodekloud/webapp-color:v1"

          env {
            name = "MY_SECRET"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.my-secret.metadata.0.name
                key = "my-secret-key"
              }
            }
          }

          port {
            container_port = 8080
          }
        }
      }
    }
  }
}



resource "kubernetes_service" "my-service" {
  metadata {
    name = "my-service"
  }

  spec {
    selector = {
      app = "my-app"
    }

    port {
      name = "http"
      port = 80
      target_port = 8080
    }
  }
}


# resource "kubernetes_ingress" "my-ingress" {
#   metadata {
#     name = "my-ingress"
#     annotations = {
#       "kubernetes.io/ingress.class" = "nginx"
#     }
#   }

#   spec {
#     rule {
#       host = "my-app.example.com"
#       http {
#         path {
#           path = "/"
#           backend {
#             service_name = kubernetes_service.my-service.metadata.0.name
#             service_port = kubernetes_service.my-service.spec.0.ports.0.name
#           }
#         }
#       }
#     }
#   }
# }


resource "kubernetes_manifest" "my-ingress" {
  manifest = {
    "apiVersion" = "traefik.containo.us/v1alpha1"
    "kind"       = "IngressRoute"
    "metadata" = {
      "name"      = "my-ingress"
      "namespace" = "default"
    }
    "spec" = {
      "entryPoints" = ["web"]
      "routes" = [
        {
          "match" = "Host(`my-host.com`) && PathPrefix(`/`)"
          "kind" = "Rule"
          "services" = [
            {
              "name" = "my-service"
              "port" = "80"
            }
          ]
        }
      ]
    }
  }
}



