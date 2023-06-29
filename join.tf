locals {
    a = ["Spoon", "exists"]
    b = ["only", "in", "matrix"]
}

output "join" {
    value = join(" ", local.a, local.b)
}
