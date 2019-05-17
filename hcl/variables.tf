variable webserver_count {
  default = 1
}

variable appserver_count {
  default = 3
}

locals {
  default_tags = {
    Organization = "terraform-core"
  }
}

variable "appserver_tags" {
  type    = "map"
  default = {}
}

variable "webserver_tags" {
  type    = "map"
  default = {}
}

variable "asg_tags" {
  type    = "map"
  default = {}
}
