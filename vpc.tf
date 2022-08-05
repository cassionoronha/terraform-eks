resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_cidr_block}"

  tags = "${merge(local.common_tags, tomap({"Name" = "vpc-${var.productname}-${var.suffix}"}))}"
  enable_dns_hostnames = true
}
