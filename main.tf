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
  tags = merge(var.tags, {
    tw_apac_git_commit           = "f4513394e68c4b135e36f279fe5a97c994971574"
    tw_apac_git_file             = "terraform-apac-ec2/main.tf"
    tw_apac_git_last_modified_at = "2024-05-25 03:26:42"
    tw_apac_git_last_modified_by = "clguo@thoughtworks.com"
    tw_apac_git_modifiers        = "clguo"
    tw_apac_git_org              = "clgcn"
    tw_apac_git_repo             = "example-terraform"
    tw_apac_yor_name             = "vpc"
    tw_apac_yor_trace            = "063b45ee-3c46-4a5d-a9f0-540c0e662506"
  })
}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "172.16.10.0/24"
  tags = merge(var.tags, {
    tw_apac_git_commit           = "f4513394e68c4b135e36f279fe5a97c994971574"
    tw_apac_git_file             = "terraform-apac-ec2/main.tf"
    tw_apac_git_last_modified_at = "2024-05-25 03:26:42"
    tw_apac_git_last_modified_by = "clguo@thoughtworks.com"
    tw_apac_git_modifiers        = "clguo"
    tw_apac_git_org              = "clgcn"
    tw_apac_git_repo             = "example-terraform"
    tw_apac_yor_name             = "subnet"
    tw_apac_yor_trace            = "c8f67920-d029-4fe7-80d7-6e0c8ce1f873"
  })
}

resource "aws_network_interface" "interface" {
  subnet_id   = aws_subnet.subnet.id
  private_ips = ["172.16.10.100"]
  tags = merge(var.tags, {
    tw_apac_git_commit           = "f4513394e68c4b135e36f279fe5a97c994971574"
    tw_apac_git_file             = "terraform-apac-ec2/main.tf"
    tw_apac_git_last_modified_at = "2024-05-25 03:26:42"
    tw_apac_git_last_modified_by = "clguo@thoughtworks.com"
    tw_apac_git_modifiers        = "clguo"
    tw_apac_git_org              = "clgcn"
    tw_apac_git_repo             = "example-terraform"
    tw_apac_yor_name             = "interface"
    tw_apac_yor_trace            = "2c54c444-8825-486c-a2b2-5e322eb816c2"
  })
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  network_interface {
    network_interface_id = aws_network_interface.interface.id
    device_index         = 0
  }
  tags = merge(var.tags, (/*<box>*/ (var.tracing_tags_enabled ? { for k, v in /*</box>*/ {
    tw_apac_git_commit           = "f4513394e68c4b135e36f279fe5a97c994971574"
    tw_apac_git_file             = "terraform-apac-ec2/main.tf"
    tw_apac_git_last_modified_at = "2024-05-25 03:26:42"
    tw_apac_git_last_modified_by = "clguo@thoughtworks.com"
    tw_apac_git_modifiers        = "clguo"
    tw_apac_git_org              = "clgcn"
    tw_apac_git_repo             = "example-terraform"
    tw_apac_yor_name             = "ec2"
    tw_apac_yor_trace            = "c0c4dca3-06f7-4a26-994b-fa8f34d0b607"
  } /*<box>*/ : replace(k, "tw_apac_", var.tracing_tags_prefix) => v } : {}) /*</box>*/))
}
