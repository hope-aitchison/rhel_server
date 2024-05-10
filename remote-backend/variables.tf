### General Variables ###
variable "profile" {
  description = "Account to deploy into"
  type        = string
  default     = ""
}

variable "region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "eu-west-2" # London
}
