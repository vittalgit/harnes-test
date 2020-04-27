data "template_file" "assume_role_policy" {
  template = "${file("${path.module}/policy/assume-role-policy.json.tpl")}"
}

data "template_file" "iam_policy" {
  template = "${file("${path.module}/policy/cmp-iam-policy.json.tpl")}"
}

resource "aws_iam_role" "cmp_iam_role" {
  name               = "cmp_${var.unique_name}-role"
  description        = "Iam role managed by terraform"
  assume_role_policy = "${data.template_file.assume_role_policy.rendered}"
}

resource "aws_iam_instance_profile" "cmp_iam_instance_profile" {
  name = "cmp_${var.unique_name}_iam_instance_profile"
  role = "${aws_iam_role.cmp_iam_role.name}"
}

resource "aws_iam_policy" "cmp_iam_policy" {
  name        = "cmp_${var.unique_name}_iam_policy"
  description = "The IAM Policy managed by terraform"
  policy      = "${data.template_file.iam_policy.rendered}"
}

resource "aws_iam_policy_attachment" "cmp_iam_attach" {
  name       = "cmp_${var.unique_name}_iam_policy_attach"
  roles      = ["${aws_iam_role.cmp_iam_role.name}"]
  policy_arn = "${aws_iam_policy.cmp_iam_policy.arn}"
}
