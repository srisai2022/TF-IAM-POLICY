#data sorce of avalable zone
#data "aws_availability_zones" "availabiliy" {}
#creating ami image of linux
# data "aws_ami" "amazon_linux" {
#     most_recent = true
#     owners = [self]
#             filter {
#     name   = "name"
#     values = ["myami-*"]
#   }
    
  
# }


#Creating Keypairs

# resource "aws_key_pair" "my_aws_key" {
#   key_name   = "naren1_key"
#   #public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
# }

#creating VPC

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "VPC"
  }
}

#creating Subnet
resource "aws_subnet" "subnet_cidr" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "SUBNET"
  }
}

#creating EC2 instance

# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical
# }


resource "aws_instance" "web" {
  ami           = "ami-0a3c14e1ddbe7f23c"
  instance_type = "t2.micro"
  key_name = "naren1_key"
  iam_instance_profile = aws_iam_instance_profile.s3-bucket-role-instance-profile.name
  tags = {
    Name = "HelloWorld"
  }
}