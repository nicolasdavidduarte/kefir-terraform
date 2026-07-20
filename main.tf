resource "google_compute_network" "kefir" {
  name                    = var.network_name
  auto_create_subnetworks = false

  description = "VPC network for Kefir infrastructure"
}

resource "google_compute_subnetwork" "kefir" {
  name                     = var.subnet_name
  region                   = var.region
  network                  = google_compute_network.kefir.id
  ip_cidr_range            = "10.10.0.0/24"
  private_ip_google_access = true
  stack_type               = "IPV4_ONLY"
}

resource "google_compute_firewall" "allow_web" {
  name    = "kefir-allow-web"
  network = google_compute_network.kefir.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = ["kefir-web"]
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "kefir-allow-ssh"
  network = google_compute_network.kefir.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = ["kefir-web"]
}

resource "google_service_account" "kefir" {
  account_id   = "kefir-vm-sa"
  display_name = "Kefir VM Service Account"
}

resource "google_compute_address" "kefir" {
  name   = "kefir-ip"
  region = var.region
}