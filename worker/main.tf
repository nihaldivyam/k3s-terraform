provider "aws" {
  region  = var.region
  profile = var.profile
}


data "aws_instance" "master-node-12" {
  filter {
    name   = "image-id"
    values = [var.ami_id]
  }

  filter {
    name   = "tag:Name"
    values = ["master-1"]
  }

  filter {
    name   = "tag:Terraform"
    values = ["true"]
  }

  filter {
    name   = "tag:KubernetesCluster"
    values = [var.cluster_name]
  }
}

data "aws_subnet" "public_subnet_1" {
  cidr_block = var.public_subnet_cidr_blocks[0]
}

data "aws_iam_instance_profile" "master_profile" {
  name = "k3s-master-role-profile"
}


resource "aws_instance" "worker-node-12" {
  ami                  = var.ami_id
  instance_type        = var.worker_instance_type
  subnet_id            = data.aws_subnet.public_subnet_1.id
  
  iam_instance_profile = data.aws_iam_instance_profile.master_profile.name

  user_data = templatefile("data/agent-init.tmpl", {
    master_ip       = "13.235.13.169",
    master_local_ip = "10.0.101.34" ,
    node_token      = var.k3s_token,
    cluster_name    = var.cluster_name,
    label           = "main-stream",
    value           = "false",
    instance_env    = "dev",
    purpose         = "dev"
  })

  tags = {
    Terraform            = "true"
    Environment          = "dev"
    Name                 = "worker-1"
    "kubernetes.io/role" = "worker"
    "KubernetesCluster"  = var.cluster_name
  }

}

