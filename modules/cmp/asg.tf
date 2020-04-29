module "aws_asg" {
  source               = "./modules/aws_asg"
  unique_name          = "${var.unique_name}"
  ami_id               = "${var.ami_id}"
  instance_type        = "${var.instance_type}"
  security_groups      = "${module.aws_sg.app_sg}"
  iam_instance_profile = "${module.aws_iam.iam_instance_profile}"
  subnet_ids           = "${var.subnet_ids}"
  asg_min_size         = "${var.asg_min_size}"
  asg_max_size         = "${var.asg_max_size}"
  key_name             = "${var.key_name}"
  cmp_elb_id           = "${module.aws_elb.cmp_elb_id}"
  tags                 = var.tags
}

module "aws_iam" {
  source      = "./modules/aws_iam"
  unique_name = "${var.unique_name}"
}

module "aws_sg" {
  source      = "./modules/aws_sg"
  vpc_id      = "${var.vpc_id}"
  unique_name = "${var.unique_name}"
}
module "aws_elb" {
  source = "./modules/aws_elb"
  elb_subnet_ids  = "${var.elb_subnet_ids}"
  unique_name = "${var.unique_name}"
}
