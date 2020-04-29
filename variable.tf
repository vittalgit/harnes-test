variable "aws_region" {
  default = "us-east-1"
}

variable "aws_acccount_id" {
  default = ""
}

variable "app_env" {
  default = "np"
}

variable "app_name" {
  default = "test"
}

variable "aws_profile" {
  default = ""
}

variable "vpc_id" {
  default = "vpc-0f95cf674a2263ee9"
}

variable "subnet_ids" {
  default = ["subnet-0c20f2b065f8f4f5c"]
  type = list
}

variable "availability_zones" {
  default = ["us-east-1a, us-east-1b"]
  type = list(string)
}

variable "instance_type" {
  default = "t3a.micro"
}

variable "ami_id" {
  default = "ami-00068cd7555f543d5"
}

variable "asg_min_size" {
  default = "1"
}

variable "asg_max_size" {
  default = "1"
}

variable "key_name" {
  default = "vittal_a"
}

variable "elb_subnet_ids" {
  default = ["subnet-0c20f2b065f8f4f5c"]
  type = list
}
