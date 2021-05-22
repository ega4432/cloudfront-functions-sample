locals {
  website_routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "${var.public_dir}/${var.public_dir}/"
    },
    "Redirect": {
        "Protocol": "https",
        "HostName": "${var.distribution_domain_name}",
        "ReplaceKeyPrefixWith": "",
        "HttpRedirectCode": "301"
    }
}]
EOF
}

resource "aws_s3_bucket" "cloudfront_functions_sample" {
  bucket = var.bucket_name
  acl    = "private"

  website {
    index_document = "index.html"
    error_document = "index.html"

    routing_rules = local.website_routing_rules
  }

  tags = {
    Name = "cloudfront-functions-sample"
  }
}

resource "aws_s3_bucket_policy" "cloudfront_to_s3" {
  bucket = aws_s3_bucket.cloudfront_functions_sample.id
  policy = data.aws_iam_policy_document.cloudfront_to_s3_policy.json
}

data "aws_iam_policy_document" "cloudfront_to_s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.cloudfront_functions_sample.arn}/${var.public_dir}/*"]

    principals {
      type        = "AWS"
      identifiers = [var.oai_arn]
    }
  }
}
