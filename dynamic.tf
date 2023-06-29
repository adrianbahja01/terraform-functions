locals {
  create_vpc = true
  cidr_bl = "10.1.0.0/16"
  sg_rules = [
    {
        from_port = "443"
        to_port   = "443"
        protocol  = "tcp"
        cidr_block = "0.0.0.0/0"
    }
  ]
}

resource "aws_vpc" "test" {
    count = local.create_vpc ? 1 : 0

    cidr_block = local.cidr_bl
}

resource "aws_security_group" "test" {
    name = "test"
    vpc_id = aws_vpc.test[0].id

    dynamic "ingress" {
      for_each = local.sg_rules
      content {
        from_port = ingress.value.from_port
        to_port = ingress.value.to_port
        protocol = ingress.value.protocol
        cidr_blocks = [ ingress.value.cidr_block ]
      }
    }
}
