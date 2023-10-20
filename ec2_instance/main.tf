provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "spacelift_demo_instance" {
  ami = "ami-0b5785917b1616d16"
  instance_type = "t2.micro"
  subnet_id = "subnet-0e146269065c4aec5"
  security_groups = [ "sg-0a1dfe7fa79c68b2e" ]

  tags = {
    "Name" = "spacelift_demo_instance"
    "author" = "phogan"
  }

}