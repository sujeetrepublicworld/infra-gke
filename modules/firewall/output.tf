output "firewall_http" {
  value = google_compute_firewall.allow_http.id
}

output "firewall_ssh" {
  value = google_compute_firewall.allow_ssh.id
}