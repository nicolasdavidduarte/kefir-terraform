variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
}

variable "region" {
  description = "Default region"
  type        = string
}

variable "zone" {
  description = "Default zone"
  type        = string
}

variable "ssh_user" {
  description = "SSH username"
  type        = string
}

variable "public_key_path" {
  description = "Path to local public SSH key"
  type        = string
}