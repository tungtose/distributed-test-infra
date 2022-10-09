resource "kubernetes_config_map" "configmap_locust_file" {
  metadata {
    name = "locustfile"
  }

  data = {
    "main.py" = "${file("./config/main.py")}"
  }
}

resource "helm_release" "locust" {
  namespace        = "locust"
  create_namespace = true

  name       = "locust"
  repository = "https://charts.deliveryhero.io"
  chart      = "locust"
  version    = "0.30.0"

  values = [
    templatefile("./config/locust-values.yaml", {})
  ]

}
