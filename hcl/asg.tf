resource "aws_launch_template" "example" {
  name_prefix   = "example"
  image_id      = "ami-1a2b3c"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "bar" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 5

  launch_template {
    id      = "${aws_launch_template.example.id}"
    version = "$Latest"
  }

  tags = ["${concat(
    list(local.default_tags),
    list(var.asg_tags)
  )}"]
}
