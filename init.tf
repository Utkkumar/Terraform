variable "force_recreate" {
 description = "Set this to true to force recreation of the null resource"
 type        = bool
 default     = false
}
resource "null_resource" "init_trigger" {
 # The triggers block ensures that the resource is recreated when force_recreate is true
 triggers = {
   reconfigure = "${tostring(var.force_recreate)}"
 }
 provisioner "local-exec" {
   command = "echo 'Initialization complete'"
 }
 lifecycle {
   create_before_destroy = true
 }
}
output "recreate_status" {
 value = "Resource was ${var.force_recreate ? "recreated" : "not recreated"}"
}
