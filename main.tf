provider "google-beta" {
  credentials = file(var.credentials_file)

  project = var.project
  region  = var.region
}

resource "google_project_service" "composer_api" {
  provider = google-beta
  project = var.project
  service = "composer.googleapis.com"
  // Disabling Cloud Composer API might irreversibly break all other
  // environments in your project.
  disable_on_destroy = false
}

resource "google_project_iam_member" "service_agent_role" {
  provider = google-beta
  project  = var.project
  member   = format("serviceAccount:service-%s@cloudcomposer-accounts.iam.gserviceaccount.com", var.project_number)
  role     = "roles/composer.ServiceAgentV2Ext"
}

resource "google_composer_environment" "example_environment" {
  provider = google-beta
  name = "example-environment"

  config {

    // Add your environment configuration here
    software_config {
      image_version = "composer-2.0.20-airflow-2.2.5"
    }
  }
}