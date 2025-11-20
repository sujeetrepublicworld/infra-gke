variable "vpc_name" {
  type = string

}
variable "subnets" {
  description = "A map of subnets to be created"
  type = map(object({
    name        = string
    region      = string
    cidr_block  = string # Use a string instead of a list for a single CIDR block
    subnet_type = string # Optional: Specify 'public' or 'private'
  }))
  default = {
    "subnet-1" = {
      name        = "subnet-1"
      region      = "us-central1"
      cidr_block  = "10.0.1.0/24"
      subnet_type = "private" # Could be 'public' or 'private'
    },
    "subnet-2" = {
      name        = "subnet-2"
      region      = "us-west1"
      cidr_block  = "10.1.1.0/24"
      subnet_type = "public" # Could be 'public' or 'private'
    }
  }
}

