resource "aws_security_group" "allow_ssh" {
  name        = "harness-sg-ssh-${var.unique_name}"
  description = "Allow SSH to harness delegate, managed by terraform"
  vpc_id      = "${var.vpc_id}"

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
