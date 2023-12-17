

resource "kubernetes_namespace" "ingress" {
  metadata {
    name = "ingress"
  }
}


resource "helm_release" "ingress" {
  name = "ingress"

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = kubernetes_namespace.ingress.metadata.0.name

  set {
    name  = "controller.service.externalTrafficPolicy"
    value = "Local"
  }

  # version   = "4.5.2"
  version = "4.8.3"

  depends_on = [
    kubernetes_namespace.ingress
  ]
}