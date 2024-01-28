terraform {
  required_version = ">=1.4.6"
  required_providers {
    aws= {
        version = ">=5.3.0"
        source = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "new-backend-bucket-10-11"
    dynamodb_table = "backend_dydb"
    region = "ap-south-1"
    encrypt = true
    key = "dev/terraform.tfstate"
  }
}