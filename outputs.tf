output "network_name" {
  description = "VPC network name"
  value       = google_compute_network.kefir.name
}

output "subnetwork_name" {
  description = "Subnet name"
  value       = google_compute_subnetwork.kefir.name
}

output "service_account_email" {
  description = "Service Account email"
  value       = google_service_account.kefir.email
}

output "static_ip" {
  description = "Reserved static IP"
  value       = google_compute_address.kefir.address
}

output "public_ip" {
  value = google_compute_address.kefir.address
}

output "vm_name" {
  value = google_compute_instance.kefir.name
}