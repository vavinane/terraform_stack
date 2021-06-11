//network.tf
# aws_subnet.subnet1:
resource "aws_subnet" "subnet1" {
    assign_ipv6_address_on_creation = false
    cidr_block                      = "192.168.0.0/25"
    tags                            = {
        "Name" = "subnet1"
    }
    tags_all                        = {
        "Name" = "subnet1"
    }
    vpc_id                          = aws_vpc.vpcdemo.id

    timeouts {}
}

# aws_subnet.subnet2:
resource "aws_subnet" "subnet2" {
    assign_ipv6_address_on_creation = false
    cidr_block                      = "192.168.0.128/25"
    tags                            = {
        "Name" = "subnet2"
    }
    tags_all                        = {
        "Name" = "subnet2"
    }
    vpc_id                          = aws_vpc.vpcdemo.id

    timeouts {}
}

# aws_subnet.subnet3:
resource "aws_subnet" "subnet3" {
    assign_ipv6_address_on_creation = false
    cidr_block                      = "192.168.1.0/25"
    tags                            = {
        "Name" = "subnet3"
    }
    tags_all                        = {
        "Name" = "subnet3"
    }
    vpc_id                          = aws_vpc.vpcdemo.id

    timeouts {}
}

# aws_subnet.subnet4:
resource "aws_subnet" "subnet4" {
    cidr_block                      = "192.168.1.128/25"
    tags                            = {
        "Name" = "subnet4"
    }
    tags_all                        = {
        "Name" = "subnet4"
    }
    vpc_id                          = aws_vpc.vpcdemo.id

    timeouts {}
}

# aws_vpc.vpcdemo:
resource "aws_vpc" "vpcdemo" {
    assign_generated_ipv6_cidr_block = false
    cidr_block                       = "192.168.0.0/23"
    enable_classiclink               = false
    enable_classiclink_dns_support   = false
    enable_dns_hostnames             = false
    enable_dns_support               = true
    instance_tenancy                 = "default"
    tags                             = {
        "Name" = "vpcdemo"
    }
    tags_all                         = {
        "Name" = "vpcdemo"
    }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpcdemo.id

  tags = {
    Name = "vpcdemo"
  }
}

resource "aws_route_table" "vinkumrtb" {
  vpc_id = aws_vpc.vpcdemo.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}