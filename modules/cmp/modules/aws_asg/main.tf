data "template_file" "user_data" {
  template = "${file("${path.module}/userdata/user-data.sh.tpl")}"

  vars = {
    test = "test"
  }
}
resource "aws_launch_configuration" "cmp_launch_configuration" {
  name                 = "cmp-${var.unique_name}-launch_configuration"
  image_id             = "${var.ami_id}"
  instance_type        = "${var.instance_type}"
  security_groups      = ["${var.security_groups}"]
  key_name             = "${var.key_name}"
  iam_instance_profile = "${var.iam_instance_profile}"
  user_data            = "${data.template_file.user_data.rendered}"

  /*root_block_device {
    volume_size           = "${var.root_disk_size}"
    delete_on_termination = true
  }*/

  lifecycle {
    create_before_destroy = true
  }
  //tags = "${var.tags}"
}

resource "aws_autoscaling_group" "cmp_autoscaling_group" {
  name                 = "cmp-${var.unique_name}-asg"
  launch_configuration = "${aws_launch_configuration.cmp_launch_configuration.id}"
  min_size             = "${var.asg_min_size}"
  max_size             = "${var.asg_max_size}"
  vpc_zone_identifier = var.subnet_ids
  //vpc_zone_identifier  = ["${split(",", join(var.sub_ids))}"]
  depends_on           = [aws_launch_configuration.cmp_launch_configuration]

  lifecycle {
    create_before_destroy = true
  }
  tag {
    key = "Name"
    value = "${lookup(var.tags, "Name")}"
    propagate_at_launch = true
  }
  tag {
    key = "Environment"
    value = "${lookup(var.tags, "Environment")}"
    propagate_at_launch = true
  }
  tag {
    key = "Product"
    value = "${lookup(var.tags, "Product")}"
    propagate_at_launch = true

  }
}


resource "aws_autoscaling_attachment" "cmp_asg_attachment" {
  autoscaling_group_name = "${aws_autoscaling_group.cmp_autoscaling_group.id}"
  elb = "${var.cmp_elb_id}"
}
