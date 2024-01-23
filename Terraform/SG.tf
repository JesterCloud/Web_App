resource "aws_security_group" "EC2SGPublic" {
    name = "PublicSecurityGroup"
    description = "PublicSG for EC2"
    vpc_id = aws_vpc.EmployeeVPC.id

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] # Accede a HTTP
    }

    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Acceso SSH desde cualquier dirección IP
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Acceso HTTPS desde cualquier dirección IP
  }

     egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Permitir todo el tráfico de salida
  }

  tags = {
    Name = "PublicSG"
  }
}
