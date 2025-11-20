terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.12.0"
    }
  }

  backend "gcs" {
    bucket  = "infra-test-gkec"
    prefix  = "terraform/state"
    project = var.project_id   # ✅ Optional, can use variable
  }
}


provider "google" {
  project     = var.project_id
  region      = var.region
}
