terraform {
  backend "s3" {
    bucket = "cloudfront-functions-sample-tfstate"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}
