# Kefir Terraform

Infrastructure as Code (IaC) for the **Kefir** project using **Terraform** and **Google Cloud Platform (GCP)**.

This repository provisions and manages the modularized cloud infrastructure required to deploy the Kefir application (Frontend, Backend, and PostgreSQL) on a Google Compute Engine VM using Docker Compose.

## Architecture & Goals

- **Modular Design**: Infrastructure separated into reusable modules (`network`, `firewall`, `compute`, `service-account`).
- **Secure Secrets Management**: Automated password generation for PostgreSQL using `random_password` injected dynamically via `templatefile()`.
- **Environment Isolation**: Environment configurations decoupled inside `environments/` (e.g., `dev`).
- **Automated Provisioning**: Startup script provisions Docker, Docker Compose, dynamically resolves public IP metadata, and bootstraps the full app stack on boot.

## Implemented Infrastructure

- **Compute Engine**: Debian 13 VM (`e2-micro`) with persistent boot disk.
- **VPC & Networking**: Dedicated VPC Network, Subnet with Private Google Access, and Static External IP.
- **Firewall Rules**: Ingress rules for SSH (`22`), Web (`80`, `443`), and Application services (`3000`, `8080`).
- **IAM**: Custom Service Account attached to the VM instance.
- **Random Provider**: Automated secret generation for database credentials.

## Project Structure

```text
.
├── environments/
│   └── dev/
│       ├── main.tf
│       ├── outputs.tf
│       ├── variables.tf
│       ├── terraform.tfvars
│       └── versions.tf
├── modules/
│   ├── compute/
│   ├── firewall/
│   ├── network/
│   └── service-account/
├── scripts/
│   └── startup.sh.tftpl
└── README.md
```
## Prerequisites

- Terraform (>= 1.15.0)
- Google Cloud CLI (`gcloud`)
- An active GCP project
- SSH Key Pair generated locally:
```bash
  ssh-keygen -t ed25519 -f ~/.ssh/kefir
```

Authenticate GCP credentials:

```bash
gcloud auth application-default login
```

## Usage

Navigate to the target environment directory:

```bash
cd environments/dev
```

Initiate the project

```bash
terraform init
```

Generate and inspect the execution plan:

```bash
terraform plan -out=tfplan
```

Apply the changes:

```bash
terraform apply tfplan
```

Once applied, Terraform will output the assigned static public IP address. 
You can access the application frontend at http://<PUBLIC_IP>:3000.

To destroy the environment:

```bash
terraform destroy
```

## Status

✅ Base infrastructure, networking, security, and automated single-VM deployment active. 
Additional cloud native services will be introduced as needed.