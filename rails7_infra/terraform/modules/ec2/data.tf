data "aws_key_pair" "ja-keypair" {
  key_name           = "ja-keypair"
  include_public_key = true
}