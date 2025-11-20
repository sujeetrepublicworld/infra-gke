module "vpc" {
  source   = "../../modules/google_vpc"
  vpc_name = var.vpc_name
  subnets  = var.subnets
}

module "firewall" {
  source         = "../../modules/firewall"
  network_id     = module.vpc.network_id_vpc
  firewall_rules = var.firewall_rules
  environment    = var.environment
}

module "gke" {
  source           = "../../modules/GKE_cluster"
  gke_version      = var.gke_version
  network_id_vpc   = module.vpc.network_id_vpc
  subnet_ids       = module.vpc.subnet_ids[0]
  node_pool_config = var.node_pool_config
  depends_on       = [module.firewall]
}



