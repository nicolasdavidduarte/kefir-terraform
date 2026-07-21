# Kefir Terraform

Infrastructure as Code (IaC) for the **Kefir** project using **Terraform** and **Google Cloud Platform (GCP)**.

This repository provisions and manages the cloud infrastructure required to deploy the Kefir application in a reproducible and version-controlled manner.

## Goals

- Manage infrastructure using Terraform.
- Learn and apply Infrastructure as Code best practices.
- Automate the deployment of cloud resources in Google Cloud.
- Keep infrastructure definitions separate from the application source code.

## Planned Infrastructure

The project will gradually evolve to provision resources such as:

- Google Cloud Run
- Artifact Registry
- Secret Manager
- Cloud SQL (PostgreSQL)
- Service Accounts and IAM
- Cloud Storage
- Networking resources

## Project Structure

```text
.
├── main.tf
├── outputs.tf
├── providers.tf
├── variables.tf
├── versions.tf
└── README.md
```

## Prerequisites

- Terraform
- Google Cloud CLI (`gcloud`)
- A Google Cloud project
- Application Default Credentials configured
- Generate an SSH key pair:
```bash
  ssh-keygen -t ed25519 -f ~/.ssh/kefir
```

Authentication:

```bash
gcloud auth application-default login
```

## Usage

Initialize the project:

```bash
terraform init
```

Review the execution plan:

```bash
terraform plan
```

Apply the changes:

```bash
terraform apply
```

Destroy the managed infrastructure:

```bash
terraform destroy
```

## Status

🚧 This repository is currently under active development as part of the Kefir project. Additional modules and cloud resources will be added incrementally.