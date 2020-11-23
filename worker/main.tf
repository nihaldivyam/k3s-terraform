provider "aws" {
  region  = var.region
  profile = var.profile
}

data "aws_subnet" "public_subnet_1" {
  cidr_block = var.public_subnet_cidr_blocks[0]
}


resource "aws_instance" "worker-node-12" {
  ami                  = var.ami_id
  instance_type        = var.worker_instance_type
  subnet_id            = data.aws_subnet.public_subnet_1.id
  key_name             = data.aws_instance.master.key_name
  iam_instance_profile = data.aws_instance.master.iam_instance_profile

  user_data = templatefile("data/agent-init.tmpl", {
    master_ip       = data.aws_instance.master.public_ip,
    master_local_ip = data.aws_instance.master.private_ip,
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

