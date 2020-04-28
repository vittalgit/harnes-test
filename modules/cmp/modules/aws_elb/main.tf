resource "aws_elb" "cmp_elb" {
  //name               = "cmp_${var.unique_name}-elb"
  //availability_zones = ["${var.availability_zones}"]
  name = "cmp-elb"
  subnets = ["${var.elb_subnet_ids}"]

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  /*listener {
    instance_port      = 8000
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    //ssl_certificate_id = "${var.ssl_arn}"
  }*/

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }
}
