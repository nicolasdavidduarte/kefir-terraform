resource "google_compute_firewall" "allow_web" {
  name    = "${var.prefix}-allow-web"
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = var.target_tags
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "${var.prefix}-allow-ssh"
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.allowed_ssh_cidrs
  target_tags   = var.target_tags
}

resource "google_compute_firewall" "allow_app" {
  name     = "${var.prefix}-allow-app"
  network  = var.network_self_link
  direction = "INGRESS"
  priority  = 1000

  allow {
    protocol = "tcp"
    ports    = ["3000", "8080"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = var.target_tags
}