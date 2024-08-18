output "ec2_ip" {
  value = module.ec2.ec2_ip
}


#  importe id du vpc 
output "interface_id" {
  value = module.vpc.interface_id
}