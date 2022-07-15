terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file)

  project = var.project
  region  = var.region
  zone    = var.zone
}

/*
resource "google_compute_network" "test" {
  name                    = "composer-test-network3"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "test" {
  name          = "composer-test-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  network       = google_compute_network.test.id
}

resource "google_service_account" "test" {
  account_id   = "composer-env-account"
  display_name = "Test Service Account for Composer Environment"
}

resource "google_project_iam_member" "composer-worker" {
  role    = "roles/composer.ServiceAgentV2Ext"
  member  = "serviceAccount:${google_service_account.test.email}"
}
*/

resource "google_composer_environment" "test" {
  name   = "example-composer-env-tf-c2"
  
 config {
    software_config {
      image_version = "composer-2.0.1-airflow-2.1.4"
    }
  }
}