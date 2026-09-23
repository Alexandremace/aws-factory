module "network" {
  source = "./modules/network"
}

module "security_group" {
  source = "./modules/security_group"

  vpc_id = module.network.vpc_id
}

module "key_pair" {
  source = "./modules/key_pair"

  key_path = var.key_path
}

module "instance" {
  source = "./modules/instance"

  ami_id        = var.ami_id
  instance_type = var.instance_type

  private_subnet_id = module.network.private_subnet_id
  public_subnet_id  = module.network.public_subnet_id

  private_security_group_id = module.security_group.private_security_group_id
  public_security_group_id  = module.security_group.public_security_group_id

  key_name = module.key_pair.key_name
}