module "ecr" {
  source   = "../../modules/ecr"
  for_each = local.repositories

  name                  = each.key
  environment           = each.value.environment
  image_tag_mutability  = each.value.image_tag_mutability
  scan_on_push          = each.value.scan_on_push
  expiration_after_days = each.value.expiration_after_days
  retain_minimum_images = each.value.retain_minimum_images
  additional_tags       = each.value.tags
  attach_policy_to_ecr  = each.value.attach_policy_to_ecr
}