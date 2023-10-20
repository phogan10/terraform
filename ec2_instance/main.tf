provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "spacelift_demo_instance" {
  ami = "ami-0df435f331839b2d6"
  instance_type = "t2.micro"
  subnet_id = "subnet-0e146269065c4aec5"
  vpc_security_group_ids = [ "sg-0a1dfe7fa79c68b2e" ]
  availability_zone = "us-east-1d"
  tags = {
    "Name" = "spacelift_demo_instance"
    "author" = "phogan"
    "secretpassword" = var.secretpassword
    "nonsecret" = var.nonsecret
  }

}