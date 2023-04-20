resource "google_cloudbuild_trigger" "example" {
  project = "docker-demo-384011"
  name    = "Docker Demo"

  source_to_build {
    repo_type = "GITHUB"
    uri       = "https://github.com/LavanyaKoduri/cloudbuild"
    ref       = "refs/heads/main"
  }

  git_file_source {
    path = "cloudbuild.yaml"
        repo_type = "GITHUB"
    uri       = "https://github.com/LavanyaKoduri/cloudbuild"
    revision  = "refs/heads/main"
  }
}

