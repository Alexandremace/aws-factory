terraform {
  required_providers {
    aws = {
      source  = "opentofu/aws"
      version = "6.63.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

}