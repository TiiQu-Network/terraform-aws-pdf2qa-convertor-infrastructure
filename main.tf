# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "aws" {
  profile = "terraform-aws-pdf2qa-convertor-deploy-infrastructure"
  region = "eu-west-2"

  default_tags {
    tags = {
      hashicorp-learn = "module-use"
    }
  }
}

module "vpc" {
  source = "./modules/aws-vpc"
}

# module "aws-s3-bucket-validation" {
#   source = "./modules/aws-s3-bucket-validation"
# }
# module "aws-s3-bucket-processing" {
#   source = "./modules/aws-s3-bucket-processing"
# }
