variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "profile" {
  type    = string
  default = "default"
}

# copy token from master node and paste here.
variable "k3s_token" {
  type    = string
  default = "K10edd9b4984f8d1638509daaaecc5771b82ea6d6c2375e38d5c750d4f376c93d14::server:randomstring123"
}

variable "asg-enable-metrics" {
  type    = list(string)
  default = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

variable "cluster_name" {
  type    = string
  default = "k3s-demo"
}

variable "ami_id" {
  type    = string
  default = "ami-026dea5602e368e96"
}

variable "worker_instance_type" {
  type    = string
  default = "t3a.micro"
}

variable "public_subnet_cidr_blocks" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

# ALERT!!!! copy these from output of vpc module.
variable "private_subnet_cidr_blocks" {
  type    = list(string)
  default = ["subnet-022cd6511d5315cae",
  "subnet-01ea7040d2963e9a7",
  "subnet-08226464de1d222fb",]
}