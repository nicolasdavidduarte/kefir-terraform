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

resource "google_compute_instance" "kefir" {
  name         = "kefir"
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-13"
      size  = 30
      type  = "pd-standard"
    }
  }

  network_interface {
    network    = google_compute_network.kefir.id
    subnetwork = google_compute_subnetwork.kefir.id

    access_config {
      nat_ip = google_compute_address.kefir.address
    }
  }

  service_account {
    email  = google_service_account.kefir.email
    scopes = ["cloud-platform"]
  }

  metadata = {
    "ssh-keys"       = "${var.ssh_user}:${file(pathexpand(var.public_key_path))}"
    "startup-script" = file("${path.module}/scripts/startup.sh")
  }

  tags = [
    "kefir-web"
  ]
}