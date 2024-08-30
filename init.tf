resource "null_resource" "init_trigger" {
  triggers = {
    reconfigure = "${timestamp()}" 
  }
  provisioner "local-exec" {
    command = "echo 'Initialization complete'"
  }
  lifecycle {
    create_before_destroy = true
  }
}

