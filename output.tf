output "cloudfront_distribution" {
  value       = module.cloudfront.distribution_domain_name
  description = "The domain name of cloudfront distribution"
}
