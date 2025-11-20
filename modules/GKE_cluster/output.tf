output "gke_cluster_name" {
  description = "The ID of the created GKE cluster"
  value       = google_container_cluster.gke.name
}


