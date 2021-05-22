# CloudFront Functions Sample

![](https://img.shields.io/badge/Terraform%20version-0.13.0-blue?logo=terraform)
![](https://img.shields.io/badge/provider-aws-orange?logo=amazon-aws)
![GitHub](https://img.shields.io/github/license/ysmtegsr/cloudfront-functions-sample)

[ English | [Japanese](https://github.com/ysmtegsr/cloudfront-functions-sample/blob/main/README.ja.md) ]

This is a sample repository of CloudFront Functions.Built with HCL ( Terraform ).

ref. [Amazon CloudFront announces CloudFront Functions, a lightweight edge compute capability](https://aws.amazon.com/about-aws/whats-new/2021/05/cloudfront-functions/?nc1=h_ls)

## Setup

Prepare CLIs.

- AWS CLI
- Terraform CLI via tfenv

Create terraform var file.

```sh
$ vim terraform.tfvars
```

```terraform.tfvars
aws_access_key_id     = "XXXXXXXXXXXXXXXXXX"
aws_secret_access_key = "YYYYYYYYYYYYYYYYYYYYYYYYY"
region                = "ap-northeast-1"
bucket_name           = "cloudfront-functions-sample"
```


## How to Use

```sh
# import modules
$ terraform init

# Dry run
$ terraform plan --var-file=terraform.tfvars

# Deploy
$ terraform apply --var-file=terraform.tfvars
```

## Upload to S3

Static contents upload via AWS CLI.

```sh
$ aws s3 cp ./src s3://<BUCKET NAME>/dist/ --recursive
```


## Destroy resources

```sh
# Delete static contents from S3 bucket
$ aws s3 rm s3://<BUCKET NAME>/ --recursive

# Dry run
$ terraform plan --var-file=terraform.tfvar --destroy

# Destroy
$ terraform destroy --var-file=terraform.tfvar
```
