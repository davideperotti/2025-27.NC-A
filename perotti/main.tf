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

variable "numero_macchine" {
  description = "Numero di macchine da creare"
  type        = number

  validation {
    condition     = var.numero_macchine >= 1
    error_message = "Il numero di macchine deve essere almeno 1."
  }
}

resource "google_compute_instance" "pippo" {
  count        = var.numero_macchine
  name         = "perotti-${count.index + 1}"
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
