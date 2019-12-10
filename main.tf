
provider "null" {
}

resource "null_resource" "example" {
  count = 2

  provisioner local-exec {
    command = "echo \"Hello World${count.index}\""
  }
}
