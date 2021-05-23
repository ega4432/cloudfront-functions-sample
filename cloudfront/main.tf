resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {}

locals {
  s3_origin_id   = "s3-origin-${var.bucket_name}"
  s3_origin_path = "/${var.public_dir}"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = var.domain_name
    origin_id   = local.s3_origin_id
    origin_path = local.s3_origin_path
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }

  default_root_object = "index.html"
  enabled             = true
  is_ipv6_enabled     = true
  http_version        = "http2"

  custom_error_response {
    error_code         = 403
    response_code      = 404
    response_page_path = "/index.html"
  }

  custom_error_response {
    error_code         = 404
    response_code      = 404
    response_page_path = "/index.html"
  }

  default_cache_behavior {
    allowed_methods = ["GET", "HEAD"]
    cached_methods  = ["GET", "HEAD"]
    min_ttl         = 0     # default
    default_ttl     = 3600  # 1 hour
    max_ttl         = 86400 # 24 hours

    forwarded_values {
      cookies {
        forward = "none"
      }
      query_string = false
    }

    target_origin_id       = local.s3_origin_id
    viewer_protocol_policy = "redirect-to-https"

    function_association {
      event_type   = "viewer-request"
      function_arn = aws_cloudfront_function.url_normalization.arn
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  price_class = "PriceClass_200"

  tags = {
    Name = "cloudfront-functions-sample"
  }
}

resource "aws_cloudfront_function" "url_normalization" {
  name    = "url_normalization"
  runtime = "cloudfront-js-1.0"
  comment = "Appends index.html to request URLs"
  publish = true
  code    = file("${path.module}/functions/sample.js")
}
