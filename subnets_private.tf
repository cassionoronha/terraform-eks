resource "aws_subnet" "private_a" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.private_a_cidr_block}"
  availability_zone = "${var.aws_region}a"

  tags = "${merge(local.common_tags, tomap({"Name" = "subnet-private_1a-${var.productname}-${var.suffix}"}))}"
}

resource "aws_subnet" "private_b" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.private_b_cidr_block}"
  availability_zone = "${var.aws_region}b"

  tags = "${merge(local.common_tags, tomap({"Name" = "subnet-private_1b-${var.productname}-${var.suffix}"}))}"
}

#==> routing table and association to PRIVATE subnet a
resource "aws_route_table" "apps_private_route_a_table_private" {
  vpc_id            = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat_gateway.id}"
  }

  tags = "${merge(local.common_tags, tomap({"Name" = "rt-private_1a-${var.productname}-${var.suffix}"}))}"
}

resource "aws_route_table_association" "apps_private_a_route_table" {
  subnet_id      = "${aws_subnet.private_a.id}"
  route_table_id = "${aws_route_table.apps_private_route_a_table_private.id}"
}

#==> routing table and association to PRIVATE subnet b
resource "aws_route_table" "apps_private_route_b_table_private" {
  vpc_id            = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat_gateway.id}"
  }

  tags = "${merge(local.common_tags, tomap({"Name" = "rt-private_1b-${var.productname}-${var.suffix}"}))}"
}

resource "aws_route_table_association" "apps_private_b_route_table" {
  subnet_id      = "${aws_subnet.private_b.id}"
  route_table_id = "${aws_route_table.apps_private_route_b_table_private.id}"
}