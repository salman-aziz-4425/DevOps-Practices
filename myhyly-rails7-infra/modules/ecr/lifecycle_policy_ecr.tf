resource "aws_ecr_lifecycle_policy" "ecr_policy" {
  count = var.attach_policy_to_ecr ? 1 : 0
  repository = aws_ecr_repository.ecr_repository.name
  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,  
            "description": "Retain a minimum of 10 images",
            "selection": {
            "tagStatus": "tagged",
            "tagPrefixList": ["hyly","latest"],
              "countType": "imageCountMoreThan",
              "countNumber": ${var.retain_minimum_images}
            },
            "action": {
              "type": "expire"
            }
        },
        {
            "rulePriority": 2,
            "description": "Expire images older than ${var.expiration_after_days} days",
            "selection": {
                "tagStatus": "any",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": ${var.expiration_after_days}
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}