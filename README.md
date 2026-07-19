# terraform-oci-dns

Terraform module that manages an [Oracle Cloud Infrastructure](https://www.oracle.com/cloud/)
DNS zone. It supports primary and secondary zones in both the global (internet-facing)
and private DNS scopes.

## Usage

```hcl
module "dns_zone" {
  source = "github.com/moveeeax/terraform-oci-dns"

  compartment_id = var.compartment_id
  name           = "example.com"
  zone_type      = "PRIMARY"
  scope          = "GLOBAL"

  freeform_tags = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| oci       | >= 5.0   |

## Inputs

| Name               | Description                                                        | Type                | Default     | Required |
|--------------------|--------------------------------------------------------------------|---------------------|-------------|:--------:|
| `compartment_id`   | OCID of the compartment in which to create the DNS zone.           | `string`            | n/a         |   yes    |
| `name`             | Fully qualified domain name of the zone.                          | `string`            | n/a         |   yes    |
| `zone_type`        | Type of the zone (`PRIMARY` or `SECONDARY`).                      | `string`            | `"PRIMARY"` |    no    |
| `scope`            | Scope of the zone (`GLOBAL` or `PRIVATE`).                        | `string`            | `"GLOBAL"`  |    no    |
| `view_id`          | Private DNS view OCID when scope is PRIVATE.                       | `string`            | `null`      |    no    |
| `external_masters` | External master nameservers for SECONDARY zones.                  | `list(object(...))` | `[]`        |    no    |
| `freeform_tags`    | Free-form tags applied to the DNS zone.                           | `map(string)`       | `{}`        |    no    |
| `defined_tags`     | Defined tags applied to the zone, keyed `namespace.key`.          | `map(string)`       | `{}`        |    no    |

## Outputs

| Name          | Description                              |
|---------------|------------------------------------------|
| `id`          | OCID of the DNS zone.                    |
| `name`        | Fully qualified domain name of the zone. |
| `nameservers` | Authoritative nameservers for the zone.  |
| `serial`      | Current SOA serial of the zone.          |
| `self`        | Canonical absolute URL of the zone.      |

## License

[MIT](LICENSE)
