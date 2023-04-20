resource "google_cloud_run_service" "cloud-run-tf-t" {
  name     = "cloud-run-tf-t"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "gcr.io/docker-demo-384011/dockerb:dockerbuild"
        #image = "gcr.io/docker-demo-384011/hello-world-1:latest"
        #image ="gcr.io/docker-demo-384011/flask:latest"
      }
    }
  }

  traffic {
    latest_revision = true
    percent         = 100
  }
}

resource "google_cloud_run_service_iam_policy" "pub1-access" {
  service     = google_cloud_run_service.cloud-run-tf-t.name
  location    = google_cloud_run_service.cloud-run-tf-t.location
  policy_data = data.google_iam_policy.pub-1.policy_data
}

data "google_iam_policy" "pub-1" {
  binding {
    role    = "roles/run.invoker"
    members = ["allUsers"]
  }
}

options {
    logging = "CLOUD_LOGGING_ONLY"
  }

