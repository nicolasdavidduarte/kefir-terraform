resource "google_compute_network" "this" {
  name                    = var.network_name
  auto_create_subnetworks = false
  description             = "VPC network for Kefir infrastructure"
}

resource "google_compute_subnetwork" "this" {
  name                     = var.subnet_name
  region                   = var.region
  network                  = google_compute_network.this.id
  ip_cidr_range            = var.ip_cidr_range
  private_ip_google_access = true
  stack_type               = "IPV4_ONLY"
}