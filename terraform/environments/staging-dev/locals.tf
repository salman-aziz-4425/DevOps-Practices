locals {
  project     = "gds-prototype-20190629" # project name = GoogleDataStudio
  region      = "us-east1"
  environment = "staging-dev"

  # network
  vpc_network_name = "hyly-ml"

  # docker repository names
  dev_repo     = "ml-dev"
  staging_repo = "ml-staging"

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
                ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCZtggcpoXr9sTIEQVk1uADpZRxfgYiugwX0eG4Rd244sSHDygCazlqAZ8Oci988ADx7vfKB+HDu/g2t6riHuoi/faRdJIOu/NFwW7vk9wsT0qX3wjAUrUV9qGWjh2knEMgxCEAzFX+wjpsXf+lHT/Gw57WbPaB6GW8tWAKtPx8y5FYUiARiFlmb1rsCd0Cvjeb+uF03s5J924s880v4v1q0APLUGDuGd3FV8yILqQhqOY4SKVaHNt+1D7FD1C5kfXbCYEoVzR+G2FyZO2Z+R365adUWrxk92tJdhnEvFS9EQo/LJblgve6CJo3xgQxUoG8VT6bJRiwKxtGV921U9ka7z4Qdo+oEcltu9D/dxsDk5pLrL/7lhnwRl4Ks8XFdz5aqP+w0ZAAYBBzJX18dk6UBDr0xEXdjGAglHiwonvkkLo0qJN1lb6xHowbVKs4JtA7FkztgzfV6KiAaUKAOEKeF0Yg28ODV6Hc2ZTfLGruiXzLPmwHmY5ukvJy0aAFf2M= aksha@LAPTOP-KLQ0533A
                ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAahvwcjsXBQUzhQDBsAUWQ2LQG3/xhfMwPI8+yIs5KYsvF+kuMMQ+N4/voW3XcEEqGbmCrm8LNG/VhQ0a5iw/4H34M2KW9R+NF8F8BX8Y4pb+GrFiIq60Y+h89Sz+qzMSzqg1R5OBbMrb5Otil9xfcoG7PKC/AL7Dlm/kh+/zLj68LGRMO0obCzldlWTfiyiH5+zieiITxgmsog95opDoxdWF9VuoL/fsgJQXe2fEklraMwWoQFPfuUTcuzcm6lvVqaPZsLmI30qppb+/pcJ+zS7lLbEtrhO/bf9sE2/DMMjawTEqHvQzFdF9yj4WvzufYRi+SF5PnJv0VW8RVRqC/l7Bdif0jHUu4pboHiK3h2hJ80sBWKMbzGTBiKEybr6SHuXghyK+9Ds1BlJAZMF7emBzYVOGeey/4CZwvPjm7X24bkvu11rFiXE+iLuVeEAUqd1vxvDbVsDExRWdjDP6sHfpWvTzIhUE1kKwPLIAn5RPTDfKtl1FPyCphQdMF28= sanya matta@LAPTOP-KTAAGSHP
                ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDPi3CJlca9fn4V35sw5nozc8eiXf2m2w6Dq+nydMLr/R0YODp09hkQvvX+eubZf0XIvQxrhuGVA3LyVvRU8NWhOa29/B91sfklHWk3Jm0DKPukUaQhLtgsVDLCH3+DI6p5gTBLvAGCn6MakiVczCxLeFov4gkPzKaYJbPRJqzpca6T/kti6zxgRm099WdGaujxfZY5wc/IgHR7GstjzB7yNRpCHG4JB2i5VIiGF+BZBZ9+T51eka5l7a22lBruuYEXloTbIyMhwtu56lV8MJABbghK92RjnF2YZergN/nNYFnLHXmrSKC4fo85IMQopZfwO/ROTVKVBu4llrHojTwpfrOy3/lGwu6TNd7zTIH9VceQmnFTp1pDL4JMd39s+wcOnVeZdTgHHIkknQLRK9l4sosDMGuJVx5OBBkaoZMpQzXcv+rDXcij+zUHDsGUbW5QD+FT2qIsyy/qBPctyalAANgZxOJ01Wg4puzEs+HWTsdXk1PXCfbhmfiPT6XFGm0= work@DESKTOP-3UPD527

  EOT
}