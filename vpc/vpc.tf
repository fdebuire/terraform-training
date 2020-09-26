# Internet VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.1.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "fdebuire VPC"
  }
}

# Public Subnets
resource "aws_subnet" "main_public_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.1.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-2a"

  tags = {
    Name = "fdebuire sub_public_1"
  }
}

resource "aws_subnet" "main_public_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.1.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-2b"

  tags = {
    Name = "fdebuire sub_public_2"
  }
}

resource "aws_subnet" "main_public_3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.1.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-2c"

  tags = {
    Name = "fdebuire sub_public_3"
  }
}

# Private Subnets
resource "aws_subnet" "main_private_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.1.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-2a"

  tags = {
    Name = "fdebuire sub_private_1"
  }
}

resource "aws_subnet" "main_private_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.1.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-2b"

  tags = {
    Name = "fdebuire sub_private_2"
  }
}

resource "aws_subnet" "main_private_3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.1.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-2c"

  tags = {
    Name = "fdebuire sub_private_3"
  }
}

# Internet GW
resource "aws_internet_gateway" "main_gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "fdebuire IG"
  }
}

# route tables
resource "aws_route_table" "main_public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_gw.id
  }

  tags = {
    Name = "fdebuire IG RT"
  }
}

# route associations public
resource "aws_route_table_association" "main_public_1-a" {
  subnet_id      = aws_subnet.main_public_1.id
  route_table_id = aws_route_table.main_public.id
}

resource "aws_route_table_association" "main_public_2-a" {
  subnet_id      = aws_subnet.main_public_2.id
  route_table_id = aws_route_table.main_public.id
}

resource "aws_route_table_association" "main_public_3-a" {
  subnet_id      = aws_subnet.main_public_3.id
  route_table_id = aws_route_table.main_public.id
}