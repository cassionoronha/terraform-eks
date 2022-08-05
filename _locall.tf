locals {
    common_tags = {
        Provisioned_by = "Terraform",
        Project = "${var.productname}"
        Environment = "${var.suffix}"
    }
}