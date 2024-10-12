locals {
  prefix = "student-number"
}

module "network" {
  source = "./modules/network"
  prefix = local.prefix
}

module "rds" {
  source                      = "./modules/rds"
  prefix                      = local.prefix
  security_group_id           = module.network.db_sg_id
  tf_workshop_ex3_db_password = var.tf_workshop_ex3_db_password

}
