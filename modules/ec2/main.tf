terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}



resource "aws_instance" "ec2" {
  ami           = "ami-015875403620174eb"
  instance_type = "t2.micro"
  tags = {
    "env" = "worketyamoExercice"
  }
  network_interface {
    device_index = 0
    network_interface_id = var.my-vpc
    
  }
}
