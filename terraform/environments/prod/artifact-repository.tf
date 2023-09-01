resource "google_artifact_registry_repository" "prod_repo" {
  location      = local.region
  repository_id = local.repo_name
  description   = "Docker repository for prod environment"
  format        = "DOCKER"
}

resource "null_resource" "gcloud_command" {
  # This null_resource is just used to trigger the local-exec provisioner.

  # If you're using Terraform 0.13+, use the "triggers" argument instead:
  # triggers = { always_run = timestamp() }

  # gcloud command must configured on your machine where you running terraform commands
  provisioner "local-exec" {
    command     = <<EOT
      sudo gcloud artifacts repositories set-cleanup-policies ml-prod \
        --project=gds-prototype-20190629 \
        --location=us-east1 \
        --policy=artifacts-policy.json
    EOT
    interpreter = ["bash", "-c"]
  }

  depends_on = [google_artifact_registry_repository.prod_repo]
}

