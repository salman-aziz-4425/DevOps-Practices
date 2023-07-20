locals {
  project     = "gds-prototype-20190629" # project name = GoogleDataStudio
  region      = "us-east1"
  environment = "staging-dev"

  # network
  vpc_network_name = "hyly-ml"

  # staging-dev environment state bucket
  staging_dev_state_bucket_name = "staging-dev-state"
  staging_dev_bucket_location   = "us-east1"

  # compute engine
  name                      = "staging-dev-ml"
  machine_type              = "n2-standard-2"
  zone                      = "us-east1-b"
  disk_size                 = 80
  allow_stopping_for_update = true

  allowed_ips_for_ssh = [
    "122.129.66.210/32", # Junaid's IP
    "58.27.193.244/32",  # Junaid's IP  
  ]
  allowed_ssh_pub_keys = <<EOT
                ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDVpBmAHtXTF5o3QPImmJgHYL0gKqi/qZH0em/Fj9cAzva4lC/bvm4CHJxSfHqtZHF6pcrCm3WBK5EOZw3jc6ZR3grfwwm0OTjRWHVSVFCv3XHgfVXNSsVsfi4fYhOv+RIsXYvH9middJYJmrf2riHghlujQHwPuA2Y7y0KqD+nv4M9rTvk2g1nieg7Yx61iFKm5ygSBqOlJd6W7TtdocBZ0H65U/J2XyZkYJpLXvX/pjRd9HfbnheTKtyL0uHNNUSyNGaH/s43JdkUX6O4aw1T86LuOgegljHBjp0/j7WihEtAZvENT2Ar0nW/Csak8Diin6pexBrvQJIsAo7NyP4T ja-keypair
                ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCa8HfqHd3BhoHtXSasgbQ9/HnpEByNknicekS4LTfvZA5GKgjZm8XA0v+tyy1k5LBHQ7umVG0Dm8zuVGDJH5nC/N1zXi419csaIAvdDaEBmZQ0y4PxnW4c1Rw8oxwg43drvffGGjtGTFv5JfiaZVT1WUnVUqCnsTfbfUqsJ9eo9OM8+kQhtOIMr2A5IgFG5YmmlL5e6bL2TeHJPC4P/dE5M4KbkRQASqA4mAEojno562JR5EUa0QC1Gc3Rvrv5aREaVFZokP7r5nkRUU7fyrQ/FYwCFUr0622qKS/EIKszqhlNVnWBvA/KuivRscPZPBJY2kfzif438kOBnzVDyHuH tn-keypair
                ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBEozArQFQJjOovP4TQZTC6iYJmDG56adfrCprpqlPQFSdXw+/L6WhtyZLuQWFJRETyyFJkl/hz2DDNqx7YKhrfX4n6VPwR0F/jhaW6o/xAckrUbTrRgeN6t7kxRI+GDYs481SeH/MaHkw1C5nukLdKgnQps7430dSYFEfBHVuX4qv0JBDYmP7h24W7+/+x6JtUWx5FWAXeIuqimvAd79TvpsPYuqUbQZvGoQhme55gK1duyAkuTVvnDs/2GkdsT1sKJkgkSU6F23Jp6HtgqgC10oCS7SVuQTXQ10i2Vrdn9scV8RnUahUKpwcjsSCJMtPBGK0KF+qdjp3iGGPGO0SdU08hUyvwSRFVg6KYJSac/5zmd/kZibjvQxRa/WJwMuw/EN+bwQOARnjgDkAB2/p06pQNeCgcU9Tkqr0tncH75aX3j0+GJzBg0i+h+llrWyZLv8+22cTVd00SDd9vRmjMO+90Zt6B59dfajp0laPo7sOAzeZEkgYTn3yYxOa1sk= ubuntu@jenkins-ml
  EOT
}