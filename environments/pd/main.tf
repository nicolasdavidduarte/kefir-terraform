module "network" {
  source        = "../../modules/network"
  network_name  = "kefir-pd-network"
  subnet_name   = "kefir-pd-subnet"
  region        = var.region
  ip_cidr_range = "10.10.0.0/24"
}

module "firewall" {
  source            = "../../modules/firewall"
  network_name      = module.network.network_name
  network_self_link = module.network.network_self_link
  prefix            = "kefir-pd"
  target_tags       = ["kefir-web"]
  allowed_ssh_cidrs = ["0.0.0.0/0"]
}

module "service_account" {
  source       = "../../modules/service-account"
  account_id   = "kefir-pd-vm-sa"
  display_name = "Kefir Prod VM Service Account"
}

module "compute" {
  source                = "../../modules/compute"
  instance_name         = "kefir-pd"
  machine_type          = "e2-micro"
  zone                  = var.zone
  region                = var.region
  image                 = "debian-cloud/debian-13"
  disk_size             = 30
  network_id            = module.network.network_id
  subnet_id             = module.network.subnet_id
  service_account_email = module.service_account.email
  ssh_user              = var.ssh_user
  public_key_path       = var.public_key_path
  tags                  = ["kefir-web"]

  startup_script = templatefile("${path.module}/../../scripts/pd/startup.sh.tftpl", {
    public_ip = module.compute.public_ip
  })
}