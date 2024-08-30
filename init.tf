module "backend_migration" {
  source = "./backend_migration"

  # Pass any necessary variables
  backend_file_path = "desired_backend.tf"
}

resource "null_resource" "init_migrate" {
  provisioner "local-exec" {
    command = <<EOT
      chmod +x ${path.module}/check_and_migrate.sh
      ${path.module}/check_and_migrate.sh
    EOT
  }

  # Trigger the script when the backend file path or other conditions change
  triggers = {
    backend_file_hash = "${filemd5(module.backend_migration.backend_file_path)}"
  }
}

output "migration_status" {
  value = "Backend migration check completed."
}
