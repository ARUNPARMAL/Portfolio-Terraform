terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.10.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = #region
  secret_key = #secret key  
  access_key = # access key 
}

