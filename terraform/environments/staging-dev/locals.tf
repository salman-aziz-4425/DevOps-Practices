locals {
  project     = "gds-prototype-20190629" # project name = GoogleDataStudio
  region      = "us-east1"
  environment = "staging-dev"

  # network
  vpc_network_name = "main"

  # staging-dev environment state bucket
  staging_dev_state_bucket_name = "staging-dev-state"
  staging_dev_bucket_location   = "us-east1"

  # compute engine
  name         = "staging-dev-python"
  machine_type = "n2-standard-2"
  zone         = "us-east1-b"
  disk_size    = 20

  allowed_ips_for_ssh = [
    "122.129.66.210/32", # Junaid's IP
    "58.27.193.244/32"   # Junaid's IP
  ]
  allowed_ssh_pub_keys = <<EOT
                ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDtA6fbkNdCO2CqxnRp7SEOnTiUVeFfeToQ9m9PjVCo/Q7sSiwRTZ19DP+wOLtrZLDEAc36oKdHkuPKAAeGEEZbGPVs6TW2Bb0XUWR+/PKq+nAfrF+bF2S8Vh2Y4iy4N8Lk1YoL8RhiJKZCuvUj894wOiktGyftvj1mcxUzy32uHzDIJH6nxqbxjxm77ipsgpxlsqqKWKB4asnX2KyKlN1GQPEGtCtuix/xNSjhO1J3+zQkdfiUw4ozmsvqJeQFAomqsTUuHElPcJqpXVF+QRfal/DWqjBBenXUimpnD8Ovb407uV1CmmgNhN4eyYfbM3AZvJ68S8Y9jLjHolaSE9iL+gYbDhAHEM6YnQYF1/TfUIPbUFXY3mX3kt54A8m/bbZXn6j2cBzcMeGcQf9NpKrKtBWac6Ga5u5dP/f242LUsGv+NftcaMFFYwRh0gmz9uXPOEpVTVWtfECgQWjZaAtmh4l5fu56n32MKEa+mANv5/N+uFLEX5aYo75m3OGn7Kk= dev@Devs-MacBook-Pro.local
  EOT

  # default labels/tags
  #   default_labels = {
  #     Project   = "Hyly"
  #     Owner     = "Terraform"
  #     ManagedBy = "Junaid Ali"
  #     Environment = local.environment
  #   }

}