# module "webapp" {
#   source              = "./modules/webapp"   
#   instance_type      = var.instance_type  
#   ami_id             = var.ami_id         
#   vpc_id             = aws_vpc.csye6225.id    

#   volume_size        = var.volume_size
#   volume_type        = var.volume_type
#   allow_ports        = var.allow_ports
#   availability_zones = var.availability_zones
#   vp_cidr            = var.vp_cidr
#   region             = var.region
#   subnet_cidr_block  = var.subnet_cidr_block
# }   

# module "mysql" {
#   source              = "./modules/mysql"   
#   vpc_id             = aws_vpc.csye6225.id 
#   vp_cidr            = var.vp_cidr
#   region             = var.region
#   subnet_cidr_block  = var.subnet_cidr_block
#   availability_zones = var.availability_zones

# }



