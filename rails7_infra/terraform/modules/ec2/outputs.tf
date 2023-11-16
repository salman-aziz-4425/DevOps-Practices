output "ec2_public_ip" {
    value = aws_instance.qa_stage_server[*].public_ip
}

output "ec2_tags" {
  value = aws_instance.qa_stage_server[*].tags_all.Name
}