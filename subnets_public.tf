resource "aws_subnet" "public_a" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.public_a_cidr_block}"
  availability_zone = "${var.aws_region}a"

  tags = "${merge(local.common_tags, tomap({"Name" = "subnet-public_1a-${var.productname}-${var.suffix}"}))}"
}

resource "aws_subnet" "public_b" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.public_b_cidr_block}"
  availability_zone = "${var.aws_region}b"

  tags = "${merge(local.common_tags, tomap({"Name" = "subnet-public_1b-${var.productname}-${var.suffix}"}))}"
}

#==> routing table and association to public subnet a
resource "aws_route_table" "apps_public_route_a_table_public" {
  vpc_id            = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = "${aws_internet_gateway.igw.id}"
  }

  tags = "${merge(local.common_tags, tomap({"Name" = "rt-public_1a-${var.productname}-${var.suffix}"}))}"
}

resource "aws_route_table_association" "apps_public_a_route_table" {
  subnet_id      = "${aws_subnet.public_a.id}"
  route_table_id = "${aws_route_table.apps_public_route_a_table_public.id}"
}

#===> routing table and association to public subnet b
resource "aws_route_table" "apps_public_route_b_table_public" {
  vpc_id            = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = "${aws_internet_gateway.igw.id}"
  }

  tags = "${merge(local.common_tags, tomap({"Name" = "rt-public_1b-${var.productname}-${var.suffix}"}))}"
}

resource "aws_route_table_association" "apps_public_b_route_table" {
  subnet_id      = "${aws_subnet.public_b.id}"
  route_table_id = "${aws_route_table.apps_public_route_b_table_public.id}"
}