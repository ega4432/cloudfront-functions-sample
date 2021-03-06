variable "aws_access_key_id" {}
variable "aws_secret_access_key" {}
variable "region" {}

provider "aws" {
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
  region     = var.region
}
