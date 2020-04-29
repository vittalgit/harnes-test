variable "aws_region" {
  default = ""
}

variable "aws_acccount_id" {
  default = ""
}

variable "app_env" {
  default = "np"
}

variable "app_name" {
  default = ""
}

variable "aws_profile" {
  default = ""
}

variable "vpc_id" {
  default = ""
}

variable "subnet_ids" {}

variable "availability_zones" {
  default = ""
}

variable "instance_type" {
  default = ""
}

variable "ami_id" {
  default = ""
}

variable "unique_name" {}

variable "asg_min_size" {
  default = ""
}

variable "asg_max_size" {
  default = ""
}

variable "tags" {
  type = map
  default = {}
}

variable "key_name" {
  default = ""
}
variable "elb_subnet_ids" {
  default = ""
}
