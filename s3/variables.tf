variable "oai_arn" {
  description = "Cloudfront Origin access identity arn"
  type        = string
  default     = ""
}
variable "bucket_name" {
  description = "Bucket name for the s3"
  type        = string
  default     = "cloudfront-functions-sample"
}
variable "public_dir" {
  description = "Public directory of S3 bucket"
  type        = string
  default     = "dist"
}
