# This defines a map variable "applications" with two objects, "nestjs" and "springboot". 
# Each object has two attributes, "db_name" and "identifier". 
# The default values are "demodb_nestjs" and "nestjs-terraform-workshop-db" for "nestjs", and 
# "demodb_springboot" and "springboot-terraform-workshop-db" for "springboot".
variable "applications" {
  type = map(object({
    db_name    = string
    identifier = string
  }))
  default = {
    "nestjs" = {
      db_name    = "${var.prefix}_demodb_nestjs"
      identifier = "nestjs-terraform-workshop-db"
    },
    "springboot" = {
      db_name    = "${var.prefix}_demodb_springboot"
      identifier = "springboot-terraform-workshop-db"
    }
  }
}

# This deploys a NestJS and a Springboot Database Instance
resource "aws_db_instance" "db_instance" {
  for_each = var.applications # iterate over the map

  allocated_storage               = 10
  storage_type                    = "gp2"
  engine                          = "mysql"
  engine_version                  = "8.0.36"
  instance_class                  = "db.t3.micro"
  db_name                         = each.value.db_name    # takes value from the map
  identifier                      = each.value.identifier # takes value from the map
  username                        = "root"
  password                        = var.tf_workshop_ex3_db_password
  parameter_group_name            = "default.mysql8.0"
  skip_final_snapshot             = true
  vpc_security_group_ids          = [var.security_group_id]
  db_subnet_group_name            = aws_db_subnet_group.db_subnet_group.name
  auto_minor_version_upgrade      = true
  storage_encrypted               = true
  copy_tags_to_snapshot           = true
  enabled_cloudwatch_logs_exports = ["general", "error", "slowquery"]
  apply_immediately               = true
}

# This deploys the rds Subnet Group
resource "aws_db_subnet_group" "db_subnet_group" {
  name = "db-subnet-group"
  subnet_ids = [
    aws_subnet.public_subnet_1.id,
    aws_subnet.public_subnet_2.id
  ]

  tags = {
    Name = "db-subnet-group"
  }
}
