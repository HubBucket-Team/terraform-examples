data "aws_availability_zones" "available" {}

resource "aws_instance" "web" {
  count             = "${var.webserver_count}"
  ami               = "ami-123456789"
  instance_type     = "t1.mirco"
  availability_zone = "${element(data.aws_availability_zones.available.names, count.index)}"

  // ...

  tags = "${merge(local.default_tags, var.webserver_tags)}"

}

resource "aws_instance" "app" {
  count             = "${var.appserver_count}"
  ami               = "ami-123456789"
  instance_type     = "t1.mirco"
  availability_zone = "${element(data.aws_availability_zones.available.names, count.index)}"

  // ...

  tags = "${merge(local.default_tags, var.appserver_tags)}"
}

output "appservers_by_ip" {
  value = "${zipmap(aws_instance.app.*.id, aws_instance.app.*.private_ip)}"
}

# output "instances_by_availability_zone" {
#   value = {
#     for instance in aws_instance.app :
#     instance.availability_zone => instance.id ...
#   }
# }
