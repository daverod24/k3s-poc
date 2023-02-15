# resource "helm_release" "nginx_ingress" {
#   name       = "nginx-ingress-controller"

#   repository = "https://charts.bitnami.com/bitnami"
#   chart      = "nginx-ingress-controller"

#   set {
#     name  = "service.type"
#     value = "ClusterIP"
#   }
# }

# resource "helm_release" "database" {
#   name       = "postgres"
#   repository = "https://charts.bitnami.com/bitnami"
#   chart      = "postgresql"

# #   values = [
# #     "${file("values.yaml")}"
# #   ]

#   set {
#     name  = "auth.existingSecret"
#     value = "postgres-credentials"
#   }
# }


# resource "helm_release" "example" {
#   name       = "my-local-chart"
#   chart      = "./charts/example"
# }