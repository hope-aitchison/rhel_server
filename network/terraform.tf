terraform {
  backend "s3" {
    # Add your bucket name
    bucket = ""
    key    = "app/terraform.tfstate"
    region = "eu-west-2"

    # Add your dynamodb table name
    dynamodb_table = ""
    encrypt        = true
  }
}