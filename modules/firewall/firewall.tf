resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh-${var.environment}"
  network = var.network_id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.firewall_rules[var.environment].ssh_source_ranges
  target_tags   = var.firewall_rules[var.environment].ssh_target_tags
}

resource "google_compute_firewall" "allow_http" {
  name    = "allow-http-${var.environment}"
  network = var.network_id

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = var.firewall_rules[var.environment].http_source_ranges
  target_tags   = var.firewall_rules[var.environment].http_target_tags
}

resource "google_compute_firewall" "private_access" {
  name    = "private-access-${var.environment}"
  network = var.network_id

  allow {
    protocol = "tcp"
    ports    = ["10250"] # Allow kubelet communication (for GKE)
  }

  source_ranges = var.firewall_rules[var.environment].private_source_ranges
  target_tags   = var.firewall_rules[var.environment].private_target_tags
}
