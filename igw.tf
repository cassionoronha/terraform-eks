resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.main.id}"
  tags = "${merge(local.common_tags, tomap({"Name" = "ig-${var.productname}-${var.suffix}"}))}"
}