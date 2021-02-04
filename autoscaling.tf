resource "aws_launch_configuration" "challenge-launchconfig" {
  name_prefix     = "challenge-launchconfig"
  image_id        = var.AMIS[var.AWS_REGION]
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.mykeypair.key_name
  security_groups = [aws_security_group.challenge-instance.id]
  user_data = "${file("script.sh")}"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "challenge-autoscaling" {
  name                      = "challenge-autoscaling"
  vpc_zone_identifier       = [aws_subnet.main-public-1.id, aws_subnet.main-public-2.id]
  launch_configuration      = aws_launch_configuration.challenge-launchconfig.name
  min_size                  = 2
  max_size                  = 2
  health_check_grace_period = 3000
  health_check_type         = "ELB"
  load_balancers            = [aws_elb.my-elb.name]
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "ec2 instance for the challenge"
    propagate_at_launch = true
  }
}

