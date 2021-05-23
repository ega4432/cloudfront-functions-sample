resource "aws_s3_bucket" "cloudfront_functions_sample" {
  bucket = var.bucket_name
  acl    = "private"

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
