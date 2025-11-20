variable "network_id" {
  description = "The VPC network ID to associate with firewall rules"
  type        = string
}



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
  default = {
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
}

variable "environment" {
  description = "The environment (dev, test, prod) to tag firewall rules"
  type        = string
}
