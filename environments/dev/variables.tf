variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
}

variable "region" {
  description = "Default region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Default zone"
  type        = string
  default     = "us-central1-a"
}

variable "ssh_user" {
  description = "SSH username"
  type        = string
}

variable "public_key_path" {
  description = "Path to local public SSH key"
  type        = string
}