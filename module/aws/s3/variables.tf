variable "bucket_name" {
  description = "The name of the bucket to be created."
  type = string
}

variable "file_list" {
  description = "The list of files to upload to the bucket."
  type = set(string)
}

variable "file_path" {
  description = "Location on host system of static files."
  type = string
}