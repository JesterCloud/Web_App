resource "aws_vpc" "EmployeeVPC" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "EmployeeVPC"
  }
}

#Sunets A-------------------------------
resource "aws_subnet" "PublicA" {
  vpc_id = aws_vpc.EmployeeVPC.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public_A"
  }  
}

resource "aws_subnet" "PrivateA" {
  vpc_id = aws_vpc.EmployeeVPC.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Private_B"
  }
}

#Subnets B-------------------------------
resource "aws_subnet" "PublicB" {
  vpc_id = aws_vpc.EmployeeVPC.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
  
    tags = {
    Name = "Public_B"
  }
}

resource "aws_subnet" "PrivateB" {
  vpc_id = aws_vpc.EmployeeVPC.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "PrivateB"
  }
}