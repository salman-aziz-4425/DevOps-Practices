output "jenkins_instance_ip" {
  value = module.ec2.ec2_public_ip
}