terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "3.1.1"
    }
  }
}

locals {
  jones = ["indy", "henry", "marian"]
}

resource "null_resource" "jones" {
  for_each = toset(local.jones)
  /* triggers allows specifying a random set of values that when
     changed will cause the resource to be replaced */
  triggers = {
    name = each.value  // a special variable, "each" created by terraform
                       // the object has "each.key" and "each.value"
  }
}

output "jones" {
  value = null_resource.jones
}
