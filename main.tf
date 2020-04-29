terraform {
  backend "s3" {
    bucket = "test-vangadi"

    #key    = "${var.app_name}_${var.app_env}.tfstate"
    key = "test.tfstate"

    #bucket  = "cengage-terraform-cmp"

    #region  = "${var.aws_region}"
    encrypt = true
  }
}

provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

module "cmp" {
  source      = "./modules/cmp"
  unique_name = "cmp_${var.app_name}_${var.app_env}"

  tags = "${var.tags}"

  vpc_id             = "${var.vpc_id}"
  availability_zones = ["${var.availability_zones}"]
  subnet_ids         = "${var.subnet_ids}"
  instance_type      = "${var.instance_type}"
  ami_id             = "${var.ami_id}"
  asg_min_size       = "${var.asg_min_size}"
  asg_max_size       = "${var.asg_max_size}"
  key_name           = "${var.key_name}"
  elb_subnet_ids     = "${var.elb_subnet_ids}"
}
