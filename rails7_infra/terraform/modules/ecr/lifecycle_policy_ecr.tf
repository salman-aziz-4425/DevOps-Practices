resource "aws_ecr_lifecycle_policy" "ecr_policy" {
  count = var.expiration_after_days > 0 ? 1 : 0
  repository = aws_ecr_repository.ecr_repository.name
  policy = <<EOF
{
    "rules": [
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

resource "aws_ecr_lifecycle_policy" "retain_minimum_images_policy" {
  count       = var.retain_minimum_images > 0 ? 1 : 0
  repository  = aws_ecr_repository.ecr_repository.name
  policy = <<EOF
{
    "rules" : [
      {
        "rulePriority": 1,  
        "description": "Retain a minimum of 10 images",
        "selection": {
          "tagStatus": "any",
          "countType": "imageCountMoreThan",
          "countNumber": ${var.retain_minimum_images}
        },
        "action": {
          "type": "expire"
        }
      }
    ]
}
EOF
}