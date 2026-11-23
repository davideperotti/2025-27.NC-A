terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "8.11.0"
    }
  }
}
provider "google" {
  project = "exalted-pattern-424313-j3"
}

resource "google_compute_instance" "pippo" {
  name         = "debian12-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      # size  = 10
      # type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"
    # access_config {}
  }
}
