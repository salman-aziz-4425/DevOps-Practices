resource "google_service_account" "jenkins_sa" {
  account_id   = "jenkins-sa"
  display_name = "Jenkins Service Account"
  project      = local.project
}

resource "google_project_iam_member" "jenkins_sa_roles" {
  for_each = local.iam_roles
  project  = local.project
  role     = each.value
  member   = "serviceAccount:${google_service_account.jenkins_sa.email}"
}

resource "google_service_account_key" "service_account" {
  service_account_id = google_service_account.jenkins_sa.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}

resource "local_file" "service_account" {
  content         = base64decode(google_service_account_key.service_account.private_key)
  filename        = ".creds/jenkins-sa-creds.json"
  file_permission = "0600"
}