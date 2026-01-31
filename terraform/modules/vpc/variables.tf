variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "public_subnets" {
  description = "Public subnets CIDRs"
  type        = list(string)
}

variable "presentation_subnets" {
  description = "Presentation subnets CIDRs"
  type        = list(string)
}

variable "data_subnets" {
  description = "Data subnets CIDRs"
  type        = list(string)
}
