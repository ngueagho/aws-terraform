terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "worketyamo-terraform"
    key            = "state/terraform.tfstate"
    region         = "eu-west-3"
    encrypt        = true
    dynamodb_table = "mycomponents_tf_lockid"
    role_arn       = "arn:aws:iam::021891609025:role/MyTerraformRole"
  }
}



provider "aws" {
  region = "eu-west-3"
  assume_role {
    role_arn = "arn:aws:iam::021891609025:role/MyTerraformRole"
  }
}


module "ec2" {
  source = "./modules/ec2"
  my-vpc = module.vpc.interface_id
  
}

# variable "zone-id" {
#   default = "Z101769020724CX5F5KV5"
# }

module "vpc" {
  source = "./modules/vpc"
}