resource "google_container_cluster" "gke" {
  name       = "private-gke-cluster"
  location   = var.region
  network    = var.network_id_vpc
  subnetwork = var.subnet_ids
  # Enable private cluster setup
  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
  }

  # Control access and security
  master_authorized_networks_config {
  gcp_public_cidrs_access_enabled = false

  cidr_blocks {
    cidr_block   = "0.0.0.0/0"
    display_name = "public access"
  }
}

 
  # Enable autoscaling for the cluster
  cluster_autoscaling {
    enabled = true

    resource_limits {
      resource_type = "cpu"
      minimum       = 1
      maximum       = 10
    }
    resource_limits {
      resource_type = "memory"
      minimum       = 1
      maximum       = 10
    }
  }

  node_pool {
    name       = "default-node-pool"
    node_count = var.node_pool_config.node_count

    node_config {
      machine_type = var.node_pool_config.machine_type
      oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
    }

    # Enable autoscaler for the node pool
    autoscaling {
      min_node_count = 2
      max_node_count = 10
    }
  }

  # Enable network policy for secure pod communication
  network_policy {
    enabled = true
  }
}
