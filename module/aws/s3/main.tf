terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# aws_s3_bucket_website_configuration does not work on PowerShell.
resource "aws_s3_bucket" "site_bucket" {
  bucket = var.bucket_name
  acl    = "public-read"

  policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "PublicReadForGetBucketObjects",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${var.bucket_name}/*"
    }
  ]
}
EOF

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Name = "${var.bucket_name}"
  }
}

# Can possibly be replaced with the template module.
# https://registry.terraform.io/modules/hashicorp/dir/template/latest
locals {
  type_by_ext = {
    "css"  = "text/css"
    "html" = "text/html"
    "js"   = "application/javascript"
    "png"  = "image/png"
    "txt"  = "text/plain"
  }
}

resource "aws_s3_bucket_object" "files_to_load" {
  for_each     = var.file_list
    content_type = lookup(local.type_by_ext, split(".", each.value)[1], local.type_by_ext["txt"])
    bucket       = aws_s3_bucket.site_bucket.bucket
    key          = each.value
    source       = "${var.file_path}/${each.value}"
    etag         = filemd5("${var.file_path}/${each.value}")
}
