# output "ec2_ip" {
#   value = aws_instance.ec2.public_ip
# }


#  importe id du vpc 
output "interface_id" {
  value = module.vpc.interface_id
}