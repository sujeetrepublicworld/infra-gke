# vpc.tf

resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false      # Manually define subnets
  routing_mode            = "REGIONAL" # Routes within the region
  description             = "Custom VPC network"
}

resource "google_compute_subnetwork" "subnets" {
  for_each = var.subnets

  name                     = each.value.name
  network                  = google_compute_network.vpc.id
  region                   = each.value.region
  ip_cidr_range            = each.value.cidr_block # Using single CIDR block (string)
  private_ip_google_access = each.value.subnet_type == "private" ? true : false
  depends_on               = [google_compute_network.vpc]

  # Only private subnets need private endpoint access, no public IP for any subnet
  # dynamic "private_endpoint" {
  #   for_each = each.value.subnet_type == "private" ? [1] : []
  #   content {
  #     private_link_service_network_policies {
  #       enable = true
  #     }
  #   }
  # }
}

