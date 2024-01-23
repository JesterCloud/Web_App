provider "aws"{
    access_key = "XXXX"
    secret_key = "ASasdasfdaDFSASDADDFSASDSASSDAD"
    region = "us-east-X"
}

# Look up existing IAM role 
data "aws_iam_role" "ec2_role" {
  name = "EC2Full"
}

# Create instance profile
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "EC2FullInstanceProfile"  
  role = data.aws_iam_role.ec2_role.name
}


resource "aws_instance" "EmployeeEC2" {
    ami = "ami-0c7217cdde317cfec"
    instance_type = "t2.micro"
    #key_name = "EC2Key" #esto espara hacer SSH en la instancia SIEMPRE LOS VOY A  NECESITAR!
    iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
    subnet_id = "subnet-0ea879fcb25540b6e"
    vpc_security_group_ids = ["sg-0c794e160ad916f60"]

     user_data = templatefile("userdata.tpl", {}) #Bootstrap

    tags = {
      Name = "EmployeeEC2"
    }  
}
