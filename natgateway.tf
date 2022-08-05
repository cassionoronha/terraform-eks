resource "aws_eip" "nat_gateway" {
  vpc   = true
}

resource "aws_nat_gateway" "nat_gateway" {
  subnet_id     = "${aws_subnet.public_a.id}"
  allocation_id = "${aws_eip.nat_gateway.id}"

  depends_on = [aws_internet_gateway.igw]

  tags = "${merge(local.common_tags, tomap({"Name" = "natgateway-${var.productname}-${var.suffix}"}))}"
}