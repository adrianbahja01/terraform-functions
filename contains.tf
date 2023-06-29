locals {
  learn = ["k8s", "docker", "helm", "aws"]
}

output "contains" {
  value = contains(local.learn, "k8s")
}
