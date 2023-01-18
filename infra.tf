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
