resource "kubernetes_secret" "postgres_credentials" {
  metadata {
    name = "postgres-credentials"
  }

  data = {
    "postgres-password"    = "development"
    "password"             = "development"
    "replication-password" = "development"
  }
}