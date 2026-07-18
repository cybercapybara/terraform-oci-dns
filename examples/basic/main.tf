provider "oci" {}

module "dns_zone" {
  source = "../.."

  compartment_id = var.compartment_id
  name           = "example.com"
  zone_type      = "PRIMARY"
  scope          = "GLOBAL"

  freeform_tags = {
    Environment = "sandbox"
    ManagedBy   = "terraform"
  }
}

variable "compartment_id" {
  description = "Compartment OCID to deploy the example DNS zone into."
  type        = string
}

output "dns_zone_id" {
  value = module.dns_zone.id
}
