resource "kubernetes_deployment" "frontend" {
  metadata {
    name = "frontend"
    labels = {
      app = "frontend"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "frontend"
      }
    }

    template {
      metadata {
        labels = {
          app = "frontend"
        }
      }

      spec {
        container {
          image = "kodekloud/webapp-color:v1"
          name  = "simple-webapp"

          port {
            container_port = 8080
          }
        }
      }
    }
  }
}


resource "kubernetes_service" "webapp-service" {
  metadata {
    name = "webapp-service"
    labels = {
      app = "webapp"
    }
  }

  spec {
    selector = {
      app = "webapp"
    }

    port {
      node_port   = 30080
      port        = 8080
      target_port = 8080
    }

    type = "NodePort"
  }
}



