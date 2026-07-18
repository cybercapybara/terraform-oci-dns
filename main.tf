resource "oci_dns_zone" "this" {
  compartment_id = var.compartment_id
  name           = var.name
  zone_type      = var.zone_type
  scope          = var.scope
  view_id        = var.view_id

  dynamic "external_masters" {
    for_each = var.external_masters
    content {
      address     = external_masters.value.address
      port        = external_masters.value.port
      tsig_key_id = external_masters.value.tsig_key_id
    }
  }

  freeform_tags = var.freeform_tags
  defined_tags  = var.defined_tags
}
