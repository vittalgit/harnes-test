output "cmp_asg_id" {
  value = "${aws_autoscaling_group.cmp_autoscaling_group.id}"
}

output "cmp_asg_name" {
  value = "${aws_autoscaling_group.cmp_autoscaling_group.name}"
}
