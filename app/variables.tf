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

variable "key_pair" {
  description = "instance key pair name"
  type        = string
  default     = "" # create a key pair in AWS
}

variable "rhel_9_ami" {
  description = "free tier HVM RHEL 9 AMI"
  type        = string
  default     = "ami-035cecbff25e0d91e"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "m5.large" # additional compute required for GUI & xrdp
}

variable "internet_cidr" {
  description = "cidr block for all IP range"
  type        = string
  default     = "0.0.0.0/0"
}