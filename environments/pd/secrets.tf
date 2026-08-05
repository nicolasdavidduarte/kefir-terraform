data "google_secret_manager_secret" "jwt" {
  secret_id = "jwt-secret"
}

data "google_secret_manager_secret" "postgres" {
  secret_id = "postgres-password"
}

data "google_secret_manager_secret" "spring" {
  secret_id = "spring-datasource-password"
}

resource "google_secret_manager_secret_iam_member" "vm_secret_access" {
  for_each = {
    jwt      = data.google_secret_manager_secret.jwt.secret_id
    postgres = data.google_secret_manager_secret.postgres.secret_id
    spring   = data.google_secret_manager_secret.spring.secret_id
  }

  secret_id = each.value
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${module.service_account.email}"
}