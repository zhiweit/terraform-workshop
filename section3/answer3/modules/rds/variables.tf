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

variable "tf_workshop_ex3_private_subnet_1_id" {
  description = "The ID of the Private Subnet 1 for Exercise 3"
  default     = "subnet-0dd9714c2820df944"
}

variable "tf_workshop_ex3_private_subnet_2_id" {
  description = "The ID of the Private Subnet 2 for Exercise 3"
  default     = "subnet-0abe9cf7224a901af"
}