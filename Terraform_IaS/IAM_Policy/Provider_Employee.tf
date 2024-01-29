provider "aws"{
    access_key = "XXXXL"
    secret_key = "asdasdadasdas"
    region = "us-east-X"
}

# Create IAM User
 resource "aws_iam_user" "admin" {
    name = "Admin_User"
   
 }

# Create IAM Group
resource "aws_iam_group" "Full" {
    name = "Admin_Access"
}

# Add User to Group
resource "aws_iam_user_group_membership" "adduser" {
    user = aws_iam_user.admin.name
    groups = [aws_iam_group.Full.name]
}

# Attach Policies to Group
resource "aws_iam_group_policy_attachment" "example_s3_policy" {
  group      = aws_iam_group.Full.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_group_policy_attachment" "example_ec2_policy" {
  group      = aws_iam_group.Full.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_group_policy_attachment" "example_dynamodb_policy" {
  group      = aws_iam_group.Full.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

resource "aws_iam_group_policy_attachment" "example_rds_policy" {
  group      = aws_iam_group.Full.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
}

resource "aws_iam_group_policy_attachment" "example_Admin_policy" {
  group      = aws_iam_group.Full.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# EC2 Role ----------------------------------------------------------EC2Full

resource "aws_iam_role" "ec2_full_role" {
  name = "EC2Full"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Attach a policy granting full access to S3
resource "aws_iam_role_policy_attachment" "ec2_full_s3_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.ec2_full_role.name
}

# Attach a policy granting full access to DynamoDB
resource "aws_iam_role_policy_attachment" "ec2_full_dynamodb_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  role       = aws_iam_role.ec2_full_role.name
}

# Attach a policy granting full access to RDS
resource "aws_iam_role_policy_attachment" "ec2_full_rds_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
  role       = aws_iam_role.ec2_full_role.name
}

# Attach a policy granting full access to IAM
resource "aws_iam_role_policy_attachment" "ec2_full_iam_policy" {
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
  role       = aws_iam_role.ec2_full_role.name
}
