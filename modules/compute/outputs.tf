output "id" {
  description = "Id"
  value       = google_compute_instance.this.id
}

output "public_ip" {
  description = "Public ip"
  value       = google_compute_address.static_ip.address
}

output "instance_name" {
  description = "Name of the compute instance"
  value       = google_compute_instance.this.name
}
