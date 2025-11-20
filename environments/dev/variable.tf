variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
}
variable "region" {
  type = string
}

variable "vpc_name" {
  description = "The name of the Virtual Private Cloud (VPC)"
  type        = string
  default     = "my-vpc"
}

# Subnets Configuration
variable "subnets" {
  description = "Map of subnets with CIDR blocks and types"
  type = map(object({
    name        = string
    region      = string
    cidr_block  = string
    subnet_type = string # 'private' or 'public'
  }))
}

# Firewall rules for different environments (dev, test, prod)
variable "firewall_rules" {
  description = "Map of firewall rules for different environments"
  type = map(object({
    ssh_source_ranges     = list(string)
    http_source_ranges    = list(string)
    private_source_ranges = list(string)
    ssh_target_tags       = list(string)
    http_target_tags      = list(string)
    private_target_tags   = list(string)
  }))
}

# Node pool configuration for the GKE cluster
variable "node_pool_config" {
  description = "Configuration for the node pool"
  type = object({
    machine_type = string
    node_count   = number
  })
}

# GKE Kubernetes version
variable "gke_version" {
  description = "Kubernetes version for the GKE cluster"
  type        = string
  default     = "1.21.5-gke.1302"
}

variable "environment" {
  description = "The environment (dev, test, prod) to tag firewall rules"
  type        = string
}

