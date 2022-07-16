output "website_domain" {
  value = aws_s3_bucket.site_bucket.website_domain
}

output "hosted_zone_id" {
  value = aws_s3_bucket.site_bucket.hosted_zone_id
}
