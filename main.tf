module "s3" {
  source = "./s3"

  oai_arn     = module.cloudfront.oai_arn
  bucket_name = var.bucket_name
  distribution_domain_name = module.cloudfront.distribution_domain_name
}

module "cloudfront" {
  source = "./cloudfront"

  domain_name = "${var.bucket_name}.s3.${var.region}.amazonaws.com"
  bucket_name = var.bucket_name
}
