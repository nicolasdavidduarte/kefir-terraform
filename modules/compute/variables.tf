variable "instance_name" {
  description = "Name of the compute instance"
  type        = string
}

variable "machine_type" {
  description = "GCP machine type"
  type        = string
  default     = "e2-micro"
}

variable "zone" {
  description = "GCP zone where the instance will be created"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "image" {
  description = "OS image for the boot disk"
  type        = string
  default     = "debian-cloud/debian-13"
}

variable "disk_size" {
  description = "Size of the boot disk in GB"
  type        = number
  default     = 30
}

variable "network_id" {
  description = "VPC network ID or self_link"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID or self_link"
  type        = string
}

variable "service_account_email" {
  description = "Email of the service account attached to the instance"
  type        = string
}

variable "ssh_user" {
  description = "SSH username for instance access"
  type        = string
}

variable "public_key_path" {
  description = "Path to the SSH public key file"
  type        = string
}

variable "tags" {
  description = "Network tags applied to the instance"
  type        = list(string)
  default     = ["kefir-web"]
}

variable "startup_script" {
  description = "Rendered startup script content"
  type        = string
}