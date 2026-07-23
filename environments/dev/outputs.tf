output "public_ip" {
  description = "Public Id assigned to the VM"
  value       = module.compute.public_ip
}

output "vm_name" {
  description = "Instance name"
  value       = module.compute.instance_name
}