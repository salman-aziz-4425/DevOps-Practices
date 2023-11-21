locals {
  repositories = {
    "hylybe-qa" = {
      image_tag_mutability  = "MUTABLE"
      scan_on_push          = true
      expiration_after_days = 7
      environment           = "qa"
      tags = {
        Project     = "myhyly"
        Owner       = "junaid"
        Purpose     = "rails7-qa-images"
        Description = "For rails7 deployment"
      }
    }

    "hylybe-stg" = {
      image_tag_mutability  = "MUTABLE"
      scan_on_push          = true
      expiration_after_days = 3
      environment           = "staging"
      tags = {
        Project     = "myhyly"
        Owner       = "junaid"
        Purpose     = "rails7-dev-images"
        Description = "For rails7-deployment"
      }
    }

  }
}