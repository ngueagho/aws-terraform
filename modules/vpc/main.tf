terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_vpc" "my-vpc" {
  cidr_block       = "10.0.0.0/16"

   tags = {
    "env" = "worketyamoExercice"
  }
}


# create public subnet

resource "aws_subnet" "my-subnet" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.1.0/24"

   tags = {
    "env" = "worketyamoExercice"
  }
}

# 

resource "aws_network_interface" "example" {
  subnet_id = aws_subnet.my-subnet.id
  private_ips = ["10.0.1.10"]
 tags = {
    "env" = "worketyamoExercice"
  }
}