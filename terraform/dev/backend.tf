terraform {
  backend "s3" {
    bucket         = "kerolos-terraform-state"
    key            = "eks/dev/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
