locals {
    line = "Spoon exists only in matrix"
}

output "split" {
    value = split(" ", local.line)
}
