# Configure the AWS Provider
# Don't need this if the right environment variables are set for AWS.
provider "aws" {
  region = "us-east-1"
}

//module "s3" {
//  source = "./module/aws/s3"
//  bucket_name = "${var.app_name}.${var.domain_base}"
//  file_path = "${path.root}/${var.file_dir}"
//  file_list = fileset("./${var.file_dir}/", "*")
//}
//
//module "route53" {
//  source = "./module/aws/route53"
//  bucket_domain = module.s3.website_domain
//  bucket_zone_id = module.s3.hosted_zone_id
//  domain = "${var.app_name}.${var.domain_base}"
//  zone_id = var.zone_id
//}
//
//module "ssm" {
//  for_each = var.params
//    source = "./module/aws/ssm"
//    ssm_key = "/${var.params_prefix}/${each.key}"
//    ssm_value = each.value
//}

resource "null_resource" "authenticate_for_ecr" {
  provisioner "local-exec" {
    command = "(Get-ECRLoginCommand -Region $env:AWS_DEFAULT_REGION).Command"
    interpreter = ["PowerShell", "-Command"]
    working_dir = path.root
  }
}

module "ecr" {
  source = "./module/aws/ecr"
  repository_name = "helloworld"

  depends_on = [
    null_resource.authenticate_for_ecr
  ]
}