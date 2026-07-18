variable "compartment_id" {
  description = "OCID of the compartment in which to create the DNS zone."
  type        = string
}

variable "name" {
  description = "Fully qualified domain name of the zone (e.g. example.com)."
  type        = string
}

variable "zone_type" {
  description = "Type of the zone."
  type        = string
  default     = "PRIMARY"

  validation {
    condition     = contains(["PRIMARY", "SECONDARY"], var.zone_type)
    error_message = "zone_type must be PRIMARY or SECONDARY."
  }
}

variable "scope" {
  description = "Scope of the zone."
  type        = string
  default     = "GLOBAL"

  validation {
    condition     = contains(["GLOBAL", "PRIVATE"], var.scope)
    error_message = "scope must be GLOBAL or PRIVATE."
  }
}

variable "view_id" {
  description = "OCID of the private DNS view when scope is PRIVATE. Null for global zones."
  type        = string
  default     = null
}

variable "external_masters" {
  description = "List of external master nameservers for SECONDARY zones."
  type = list(object({
    address     = string
    port        = optional(number)
    tsig_key_id = optional(string)
  }))
  default = []
}

variable "freeform_tags" {
  description = "Free-form tags applied to the DNS zone."
  type        = map(string)
  default     = {}
}

variable "defined_tags" {
  description = "Defined tags applied to the DNS zone, keyed as \"namespace.key\"."
  type        = map(string)
  default     = {}
}
