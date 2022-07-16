variable "app_name" {
  type = string
  default = "tf"
}

variable "domain_base" {
  type = string
  default = "ladylawful.com"
}

variable "file_dir" {
  type = string
  default = "static"
}

variable "params" {
  description = "The SSM parameters to load into AWS."
  type = map
  default = {
    "name" = "Roxy"
    "occupation" = "muse"
  }
}

variable "params_prefix" {
  type = string
  default = "tf_test"
}

variable "zone_id" {
  type = string
  default = "Z19N66SSDNPQCD"
}
