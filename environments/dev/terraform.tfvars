# terraform.tfvars
region = "asia-south1"
environment = "dev"
# GCP Project ID
project_id = "dev-test-371111"
vpc_name   = "test-vpc-dev"

# Subnets Configuration
subnets = {
  "subnet-dev" = {
    name        = "subnet-dev"
    region      = "us-central1"
    cidr_block  = "10.0.1.0/24"
    subnet_type = "private"
  },
  "subnet-test" = {
    name        = "subnet-test"
    region      = "us-west1"
    cidr_block  = "10.0.2.0/24"
    subnet_type = "private"
  },
  "subnet-prod" = {
    name        = "subnet-prod"
    region      = "us-east1"
    cidr_block  = "10.0.3.0/24"
    subnet_type = "private"
  }
}

# Assigning environment-specific firewall rules
firewall_rules = {
  dev = {
    ssh_source_ranges     = ["0.0.0.0/0"]
    http_source_ranges    = ["0.0.0.0/0"]
    private_source_ranges = ["10.0.0.0/8"]
    ssh_target_tags       = ["ssh-access-dev"]
    http_target_tags      = ["http-access-dev"]
    private_target_tags   = ["kube-access-dev"]
  },
  test = {
    ssh_source_ranges     = ["0.0.0.0/0"]
    http_source_ranges    = ["0.0.0.0/0"]
    private_source_ranges = ["10.0.0.0/8"]
    ssh_target_tags       = ["ssh-access-test"]
    http_target_tags      = ["http-access-test"]
    private_target_tags   = ["kube-access-test"]
  },
  prod = {
    ssh_source_ranges     = ["10.0.0.0/8"]
    http_source_ranges    = ["10.0.0.0/8"]
    private_source_ranges = ["10.0.0.0/8"]
    ssh_target_tags       = ["ssh-access-prod"]
    http_target_tags      = ["http-access-prod"]
    private_target_tags   = ["kube-access-prod"]
  }
}

# Additional variables for GKE Cluster or VM pools can be defined here
node_pool_config = {
  machine_type = "e2-medium"
  node_count   = 3
}

gke_version = "1.21.5-gke.1302"

