output "ktb-samsam-public-instance" {
  value = {
    ip = module.instance.public_instance_ips
  }
}

output "ktb-samsam-private-instance" {
  value = {
    ip = module.instance.private_instance_ips
  }
}