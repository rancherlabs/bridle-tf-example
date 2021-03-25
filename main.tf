terraform {
  backend "remote" {
    hostname = "localhost:8080"
    organization = "suse"
    token = "fake-token"

    workspaces {
      name = "bridle"
    }
  }
}

data "null_data_source" "values" {
  inputs = {
    output = var.inputvar
  }
}

output "echo_var" {
  value = data.null_data_source.values.outputs["output"]
}
