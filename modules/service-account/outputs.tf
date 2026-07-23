output "email" {
  description = "E-Mail"
  value       = google_service_account.this.email
}

output "id" {
  description = "Id"
  value       = google_service_account.this.id
}