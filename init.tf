resource "null_resource" "init_trigger" {
  provisioner "local-exec" {
    command = "echo 'Initialization complete'"
  }
}
