terraform {
  backend "s3" {
    bucket         = "devops-terraform-states-kerolos"
    key            = "dev/eks/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
