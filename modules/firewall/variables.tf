variable "network_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "network_self_link" {
  description = "Self link of the VPC network"
  type        = string
}

variable "prefix" {
  description = "Prefix for firewall rule names"
  type        = string
  default     = "kefir"
}

variable "target_tags" {
  description = "Target tags for the firewall rules"
  type        = list(string)
  default     = ["kefir-web"]
}

variable "allowed_ssh_cidrs" {
  description = "CIDR blocks allowed for SSH access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}