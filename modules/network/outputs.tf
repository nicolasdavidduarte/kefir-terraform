output "network_id" {
  description = "VPC network id"
  value       = google_compute_network.this.network_id
}

output "network_name" {
  description = "VPC network name"
  value       = google_compute_network.this.name
}

output "subnetwork_name" {
  description = "Subnet name"
  value       = google_compute_subnetwork.this.name
}

output "subnet_id" {
  description = "VPC network id"
  value       = google_compute_subnetwork.this.subnetwork_id
}

output "network_self_link" {
  description = "Reserved static IP"
  value       = google_compute_network.this.self_link
}