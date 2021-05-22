# CloudFront Functions Sample

![](https://img.shields.io/badge/Terraform%20version-0.13.0-blue?logo=terraform)
![](https://img.shields.io/badge/provider-aws-orange?logo=amazon-aws)
![GitHub](https://img.shields.io/github/license/ysmtegsr/cloudfront-functions-sample)

[ [英語](https://github.com/ysmtegsr/cloudfront-functions-sample) | 日本語 ]

CloudFront Functions の検証用サンプルリポジトリです。Terraform で構築しました。

ref. [Amazon CloudFront が軽量エッジコンピューティング機能である CloudFront Functions を発表](https://aws.amazon.com/jp/about-aws/whats-new/2021/05/cloudfront-functions/)

## セットアップ

下記の CLI を使います。

- AWS CLI
- Terraform CLI via tfenv

Terraform の定数ファイルを作成します。

```sh
$ vim terraform.tfvars
```

```terraform.tfvars
aws_access_key_id     = "XXXXXXXXXXXXXXXXXX"
aws_secret_access_key = "YYYYYYYYYYYYYYYYYYYYYYYYY"
region                = "ap-northeast-1"
bucket_name           = "cloudfront-functions-sample"
```


## 構築手順

```sh
# 各モジュールをインポート
$ terraform init

# 事前確認
$ terraform plan --var-file=terraform.tfvars

# デプロイ実行
$ terraform apply --var-file=terraform.tfvars
```
