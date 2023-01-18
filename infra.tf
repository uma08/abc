terraform {
  # Here we configure the providers we need to run our configuration
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.51.0"
    }
  }

  # With this backend configuration we are telling Terraform that the
  # created state should be saved in some Google Cloud Bucket with some prefix
  backend "gcs" {
    ## INSERT YOUR BUCKET HERE!!
    bucket = "my-medium-demo-project-state"
    prefix = "terraform/state"
    credentials = "terraform-sa.json"
  }
}

# We define the "google" provider with the project and the general region + zone
provider "google" {
  credentials = file("terraform-sa.json")
  ## INSERT YOUR PROJECT ID HERE!!
  project = "my-medium-demo-project-299218"
  region = "europe-west1"
  zone = "europe-west1-b"
}


# Enable the Compute Engine API
# Alternatively you can do this directly via the GCP GUI
resource "google_project_service" "compute" {
  ## INSERT YOUR PROJECT ID HERE!!
  project = "my-medium-demo-project-299218"
  service = "compute.googleapis.com"
  disable_on_destroy = false
}
# Enable the Cloud Resource Manager API
# Alternatively you can do this directly via the GCP GUI
resource "google_project_service" "cloudresourcemanager" {
  ## INSERT YOUR PROJECT ID HERE!!
  project = "my-medium-demo-project-299218"
  service = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = false
}

# Here we define a very small compute instance
# The actual content of it isn't important its just here for show-case purposes
resource "google_compute_instance" "default" {
  name = "terraform-test-instance"
  machine_type = "e2-micro"
  zone = "europe-west1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
  }

  # Before we can create a compute instance we have to enable the the Compute API
  depends_on = [
    google_project_service.cloudresourcemanager,
    google_project_service.compute]
}
