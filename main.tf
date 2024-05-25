data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

resource "aws_vpc" "vpc" {
  cidr_block = "172.16.0.0/16"
  tags = merge({ Name = "${var.name_prefix}vpc" }, var.tags, (/*<box>*/ (var.tracing_tags_enabled ? { for k, v in /*</box>*/ {
    tw_apac_git_commit           = "5ad8e4e058d91aadac8b684a9fa4574c48d38f6d"
    tw_apac_git_file             = "main.tf"
    tw_apac_git_last_modified_at = "2024-05-25 04:35:04"
    tw_apac_git_last_modified_by = "clguo@thoughtworks.com"
    tw_apac_git_modifiers        = "clguo"
    tw_apac_git_org              = "clgcn"
    tw_apac_git_repo             = "terraform-apac-ec2"
    tw_apac_yor_name             = "vpc"
    tw_apac_yor_trace            = "04f90682-0582-48ec-9ec3-7c8b93682b03"
  } /*<box>*/ : replace(k, "tw_apac_", var.tracing_tags_prefix) => v } : {}) /*</box>*/))
}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "172.16.10.0/24"
  tags = merge({ Name = "${var.name_prefix}subnet" }, var.tags, (/*<box>*/ (var.tracing_tags_enabled ? { for k, v in /*</box>*/ {
    tw_apac_git_commit           = "5ad8e4e058d91aadac8b684a9fa4574c48d38f6d"
    tw_apac_git_file             = "main.tf"
    tw_apac_git_last_modified_at = "2024-05-25 04:35:04"
    tw_apac_git_last_modified_by = "clguo@thoughtworks.com"
    tw_apac_git_modifiers        = "clguo"
    tw_apac_git_org              = "clgcn"
    tw_apac_git_repo             = "terraform-apac-ec2"
    tw_apac_yor_name             = "subnet"
    tw_apac_yor_trace            = "6dcf2797-f14f-455f-88b6-0d1fdd7b1f34"
  } /*<box>*/ : replace(k, "tw_apac_", var.tracing_tags_prefix) => v } : {}) /*</box>*/))
}

resource "aws_network_interface" "interface" {
  subnet_id   = aws_subnet.subnet.id
  private_ips = ["172.16.10.100"]
  tags = merge({ Name = "${var.name_prefix}interface" }, var.tags, (/*<box>*/ (var.tracing_tags_enabled ? { for k, v in /*</box>*/ {
    tw_apac_git_commit           = "5ad8e4e058d91aadac8b684a9fa4574c48d38f6d"
    tw_apac_git_file             = "main.tf"
    tw_apac_git_last_modified_at = "2024-05-25 04:35:04"
    tw_apac_git_last_modified_by = "clguo@thoughtworks.com"
    tw_apac_git_modifiers        = "clguo"
    tw_apac_git_org              = "clgcn"
    tw_apac_git_repo             = "terraform-apac-ec2"
    tw_apac_yor_name             = "interface"
    tw_apac_yor_trace            = "8d773fb5-0658-4d33-b3f7-171fbd9a6d0e"
  } /*<box>*/ : replace(k, "tw_apac_", var.tracing_tags_prefix) => v } : {}) /*</box>*/))
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  network_interface {
    network_interface_id = aws_network_interface.interface.id
    device_index         = 0
  }
  tags = merge({ Name = "${var.name_prefix}instance" }, var.tags, (/*<box>*/ (var.tracing_tags_enabled ? { for k, v in /*</box>*/ {
    tw_apac_git_commit           = "1c589b345ab4ac849c6845818204041e1ba0d7ec"
    tw_apac_git_file             = "main.tf"
    tw_apac_git_last_modified_at = "2024-05-25 04:15:20"
    tw_apac_git_last_modified_by = "clguo@thoughtworks.com"
    tw_apac_git_modifiers        = "clguo"
    tw_apac_git_org              = "clgcn"
    tw_apac_git_repo             = "terraform-apac-ec2"
    tw_apac_yor_name             = "ec2"
    tw_apac_yor_trace            = "73418ad7-3138-4b7a-a673-83050c4fb67b"
  } /*<box>*/ : replace(k, "tw_apac_", var.tracing_tags_prefix) => v } : {}) /*</box>*/))
}
