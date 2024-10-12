variable "prefix" {
  description = "Prefix to be added to all resources"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID of to be used by the DB"
  type        = string
}

variable "tf_workshop_ex3_db_password" {
  description = "value of the password for the database"
  default     = "TerraformRocksPa33W0rd!"
}
