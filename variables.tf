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

variable "network_name" {
  description = "Name of the VPC network"
  type        = string
  default     = "kefir-network"
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "kefir-subnet"
}