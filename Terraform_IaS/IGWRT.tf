#IGW adjunto al VPC
resource "aws_internet_gateway" "IGW" {
    vpc_id = aws_vpc.EmployeeVPC.id

    tags = {
      Name = "IGW_Employee"
    }
}

#RT primero crear el resource RT, para luego poner las rutas
resource "aws_route_table" "Main" {
    vpc_id = aws_vpc.EmployeeVPC.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.IGW.id
    }

    tags = {
      Name = "EmployeeRT"
    }
}

resource "aws_route_table_association" "PublicRTA" {
    subnet_id = aws_subnet.PublicA.id
    route_table_id = aws_route_table.Main.id
}

resource "aws_route_table_association" "PublicRTB" {
    subnet_id = aws_subnet.PublicB.id
    route_table_id = aws_route_table.Main.id
}

