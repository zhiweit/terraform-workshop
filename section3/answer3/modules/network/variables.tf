variable "prefix" {
  description = "Prefix to be added to all resources"
  type        = string
}

variable "tf_workshop_ex3_vpc_id" {
  description = "The ID of the VPC for Exercise 3"
  default     = ["vpc-0f4d49126323c6e56"]
}
