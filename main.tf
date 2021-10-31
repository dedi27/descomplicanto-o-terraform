provider "aws" {
    #region = "us-east-1"
    region = "${terraform.workspace == "production" ? "us-east-1" : "us-east-2"}"
    shared_credentials_file = "~/.aws/credentials"
    profile = "giropops"
}

provider "aws" {
    region = "${terraform.workspace == "production" ? "us-east-1" : "us-east-2"}"
    shared_credentials_file = "~/.aws/credentials"
    profile = "giropops"
    alias = "us1"
}

terraform {
    backend "s3" {
        bucket = "terraform-jardel"
        key = "terraform-test.tfstate"
        region = "us-east-1"
        endpoint = "s3.portal-tio.unifique-hd.net"
        skip_credentials_validation = true
        shared_credentials_file = "~/.aws/credentials"
        profile = "s3-unifique"
        encrypt = true
    }
    required_providers {
        aws = {
            version = "~> 2.0"
            source = "hashicorp/aws"
        }
    }
}
