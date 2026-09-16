# Dummy GCP stack for this region. Do not apply in recitation.

resource "google_compute_network" "example" {
  name                    = "example-vpc-us-central1"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "web" {
  name          = "example-web-us-central1"
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.example.id
}

resource "google_compute_firewall" "allow_http" {
  name    = "example-allow-http"
  network = google_compute_network.example.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}

output "network_name" {
  value = google_compute_network.example.name
}
