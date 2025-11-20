output "network_id_vpc" {
  value = google_compute_network.vpc.id
}

output "subnet_ids" {
  description = "The IDs of the created subnets"
  value       = [for subnet in google_compute_subnetwork.subnets : subnet.id]
}