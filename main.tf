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
  tags = merge({ Name = "${var.name_prefix}vpc" }, var.tags, {
    tw_apac_git_commit           = "1c589b345ab4ac849c6845818204041e1ba0d7ec"
    tw_apac_git_file             = "main.tf"
    tw_apac_git_last_modified_at = "2024-05-25 04:15:20"
    tw_apac_git_last_modified_by = "clguo@thoughtworks.com"
    tw_apac_git_modifiers        = "clguo"
    tw_apac_git_org              = "clgcn"
    tw_apac_git_repo             = "terraform-apac-ec2"
    tw_apac_yor_name             = "vpc"
    tw_apac_yor_trace            = "673c6e7b-8c9d-41aa-b7e2-9b882bb579b6"
  })
}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "172.16.10.0/24"
  tags = merge({ Name = "${var.name_prefix}subnet" }, var.tags, {
    tw_apac_git_commit           = "1c589b345ab4ac849c6845818204041e1ba0d7ec"
    tw_apac_git_file             = "main.tf"
    tw_apac_git_last_modified_at = "2024-05-25 04:15:20"
    tw_apac_git_last_modified_by = "clguo@thoughtworks.com"
    tw_apac_git_modifiers        = "clguo"
    tw_apac_git_org              = "clgcn"
    tw_apac_git_repo             = "terraform-apac-ec2"
    tw_apac_yor_name             = "subnet"
    tw_apac_yor_trace            = "1ac992ee-7257-4f1a-849a-88a76f04516a"
  })
}

resource "aws_network_interface" "interface" {
  subnet_id   = aws_subnet.subnet.id
  private_ips = ["172.16.10.100"]
  tags = merge({ Name = "${var.name_prefix}interface" }, var.tags, {
    tw_apac_git_commit           = "1c589b345ab4ac849c6845818204041e1ba0d7ec"
    tw_apac_git_file             = "main.tf"
    tw_apac_git_last_modified_at = "2024-05-25 04:15:20"
    tw_apac_git_last_modified_by = "clguo@thoughtworks.com"
    tw_apac_git_modifiers        = "clguo"
    tw_apac_git_org              = "clgcn"
    tw_apac_git_repo             = "terraform-apac-ec2"
    tw_apac_yor_name             = "interface"
    tw_apac_yor_trace            = "35232970-f7ab-445c-b0bc-f41031a44e1e"
  })
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
    tw_apac_yor_trace            = "48be4070-a446-425b-bcfd-daaece5f1ebc"
  } /*<box>*/ : replace(k, "tw_apac_", var.tracing_tags_prefix) => v } : {}) /*</box>*/))
}
