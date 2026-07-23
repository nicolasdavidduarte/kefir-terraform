resource "google_compute_address" "static_ip" {
  name   = "${var.instance_name}-ip"
  region = var.region
}

resource "google_compute_instance" "this" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size
      type  = "pd-standard"
    }
  }

  network_interface {
    network    = var.network_id
    subnetwork = var.subnet_id

    access_config {
      nat_ip = google_compute_address.static_ip.address
    }
  }

  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }

  metadata = {
    "ssh-keys"       = "${var.ssh_user}:${file(pathexpand(var.public_key_path))}"
    "startup-script" = var.startup_script
  }

  tags = var.tags
}