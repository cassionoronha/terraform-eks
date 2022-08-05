variable "productname" {
  default = "cassio-eks"
}

#provider variables
variable "aws_profile" {}
variable "aws_region" {}

#other variables
variable "suffix" {}
variable "vpc_cidr_block" {}
variable "public_a_cidr_block" {}
variable "public_b_cidr_block" {}
variable "private_a_cidr_block" {}
variable "private_b_cidr_block" {}