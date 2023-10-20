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
  }

}
/* resource "aws_ebs_volume" "spacelift_demo_volume" {
    availability_zone = "us-east-1d"
    size = 25
    encrypted = true

    tags = {
      "Name" = "spacelift_demo_volume"
      "instance" = "spacelift_demo_instance"
    }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sda1"
  volume_id = aws_ebs_volume.spacelift_demo_volume.id
  instance_id = aws_instance.spacelift_demo_instance.id

  depends_on = [ aws_ebs_volume.spacelift_demo_volume, aws_instance.spacelift_demo_instance]
} */