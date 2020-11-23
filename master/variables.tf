variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "profile" {
  type    = string
  default = "default"
}

variable "deployer-public-key" {
  type    = string
}

variable "cluster_name" {
  type    = string
  default = "k3s-demo"
}

variable "ami_id" {
  type    = string
  default = "ami-026669ec456129a70"
}

variable "master_instance_type" {
  type    = string
  default = "t3a.large"
}

variable "cluster_server_token" {
  type = string
  default = "randomstring123"
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
