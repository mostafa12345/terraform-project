terraform {
  backend "s3" {
    bucket         = "test12345456sdf"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "test"
  }
}

