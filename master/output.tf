output "master_instance_public_ip" {
  description = "Master 1 Instance Public IP"
  value       = aws_instance.master-node-12.public_ip
}


output "node_token" {
  description = "K3S Node token for agent nodes"
  value       = file("node-token")
}
