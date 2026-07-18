output "id" {
  description = "OCID of the DNS zone."
  value       = oci_dns_zone.this.id
}

output "name" {
  description = "Fully qualified domain name of the zone."
  value       = oci_dns_zone.this.name
}

output "nameservers" {
  description = "Authoritative nameservers for the zone."
  value       = oci_dns_zone.this.nameservers
}

output "serial" {
  description = "Current SOA serial of the zone."
  value       = oci_dns_zone.this.serial
}

output "self" {
  description = "Canonical absolute URL of the zone."
  value       = oci_dns_zone.this.self
}
