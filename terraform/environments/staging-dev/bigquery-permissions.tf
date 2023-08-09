resource "google_project_iam_binding" "staging_dev_sa_bigquery_admin" {
  project = local.project
  role    = "roles/bigquery.admin"
  members = [
    "serviceAccount:1087708242925-compute@developer.gserviceaccount.com",
    "serviceAccount:hyly-15@gds-prototype-20190629.iam.gserviceaccount.com",
    "serviceAccount:hyly-pipeline-general@gds-prototype-20190629.iam.gserviceaccount.com",
    "serviceAccount:hyly-pipeline@gds-prototype-20190629.iam.gserviceaccount.com",
    "serviceAccount:hylygbq@gds-prototype-20190629.iam.gserviceaccount.com",
    "serviceAccount:hylygbqstg@gds-prototype-20190629.iam.gserviceaccount.com",
    "serviceAccount:project-owner@gds-prototype-20190629.iam.gserviceaccount.com",
    "user:akshay@hy.ly",
    "user:amrutha.hyly@gmail.com",
    "user:gili@hy.ly",
    "user:hyq.gds@hy.ly",
    "user:ishtiyaq@hy.ly",
    "user:sanya.hyly@gmail.com",
  ]
}

resource "google_project_iam_binding" "staging_dev_sa_storage_admin" {
  project = local.project
  role    = "roles/storage.admin"
  members = [
    "serviceAccount:hyly-pipeline-general@gds-prototype-20190629.iam.gserviceaccount.com",
    "serviceAccount:hyly-pipeline@gds-prototype-20190629.iam.gserviceaccount.com",
    "user:akshay@hy.ly",
    "user:amrutha.hyly@gmail.com",
    "user:gili@hy.ly",
    "user:ishtiyaq@hy.ly",
    "user:sanya.hyly@gmail.com",
  ]
}