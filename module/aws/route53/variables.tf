variable "bucket_domain" {
  type = string
}

variable "bucket_zone_id" {
  type = string
}

variable "domain" {
  description = "The new domain that points to the bucket."
  type = string
}

variable "zone_id" {
  description = "Zone ID for the domain in which we're adding a subdomain."
  type = string
}