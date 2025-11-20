# backend.tf
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.12.0"
    }
  }
}


provider "google" {
  credentials = file("/home/tech25/.config/gcloud/application_default_credentials.json")
  project     = var.project_id
  region      = var.region
}
