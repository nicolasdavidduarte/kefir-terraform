output "bucket_name" {
  description = "Name of the bucket"
  value       = google_storage_bucket.terraform_demo.name
}

output "bucket_url" {
  description = "URL of the bucket"
  value       = google_storage_bucket.terraform_demo.url
}