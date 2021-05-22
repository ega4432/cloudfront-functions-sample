output "distribution_domain_name" {
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
  description = "The domain name of cloudfront distribution"
}

output "oai_arn" {
  value       = aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn
  description = "The oai of cloudfront arn"
}
