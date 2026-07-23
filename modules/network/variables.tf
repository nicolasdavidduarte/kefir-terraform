variable "network_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnetwork"
  type        = string
}

variable "region" {
  description = "GCP region for the subnetwork"
  type        = string
}

variable "ip_cidr_range" {
  description = "IP CIDR range for the subnetwork"
  type        = string
  default     = "10.10.0.0/24"
}