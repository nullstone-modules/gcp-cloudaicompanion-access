data "google_project" "this" {}

locals {
  project_id = data.google_project.this.project_id
}

# Gemini for Google Cloud
resource "google_project_service" "cloudaicompanion" {
  service                    = "cloudaicompanion.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}


# Gemini Cloud Assist
resource "google_project_service" "geminicloudassist" {
  service                    = "geminicloudassist.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}
