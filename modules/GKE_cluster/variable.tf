variable "region" {
  description = "The region where the GKE cluster will be deployed"
  type        = string
  default     = "us-central1" # Change this to your preferred region
}
variable "subnet_ids" {
  description = "The ID of the subnet to use for the GKE cluster (optional)"
  type        = string
  default     = null
}

variable "network_id_vpc" {
  description = "The ID of the VPC network to use for the GKE cluster (optional)"
  type        = string
  default     = null
}

variable "vpc_name" {
  description = "The name of the Virtual Private Cloud (VPC)"
  type        = string
  default     = "my-vpc-dev-test"
}

variable "node_pool_config" {
  description = "Node pool configuration"
  type = object({
    machine_type = string
    node_count   = number
  })
  default = {
    machine_type = "e2-medium"
    node_count   = 3
  }
}

variable "gke_version" {
  description = "Kubernetes version for the GKE cluster"
  type        = string
  default     = "1.21.5-gke.1302"
}

variable "enable_private_cluster" {
  description = "Flag to enable private cluster setup"
  type        = bool
  default     = true
}

variable "private_nodes" {
  description = "Flag to enable private nodes in the GKE cluster"
  type        = bool
  default     = true
}

variable "private_endpoint" {
  description = "Flag to enable private endpoint for the master"
  type        = bool
  default     = true
}

variable "node_autoscaler_min" {
  description = "Minimum number of nodes for autoscaling"
  type        = number
  default     = 3
}

variable "node_autoscaler_max" {
  description = "Maximum number of nodes for autoscaling"
  type        = number
  default     = 10
}

variable "enable_network_policy" {
  description = "Flag to enable network policy"
  type        = bool
  default     = true
}

variable "master_authorized_networks" {
  description = "List of CIDR blocks to control access to the master"
  type = list(object({
    cidr_block   = string
    display_name = string
  }))
  default = [
    {
      cidr_block   = "0.0.0.0/0"
      display_name = "Allow from anywhere"
    }
  ]
}

