terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.44.1"
    }
  }
}
provider "google" {
  project     = "docker-demo-384011"
  region      = "us-central1"
  zone        = "us-central1-a"
  credentials = "./keys.json"
}