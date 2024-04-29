module "ml-non-prod-lb" {
  source  = "GoogleCloudPlatform/lb-http/google"
  version = "~> 9.0"

  project              = local.project
  name                 = local.lb_name
  ssl                  = local.lb_ssl
  use_ssl_certificates = local.lb_use_ssl_certificates
  ssl_certificates     = local.lb_ssl_certificates
  firewall_networks    = [data.google_compute_network.hyly-network.name]

  url_map        = google_compute_url_map.ml-stg-dev.self_link
  create_url_map = local.lb_create_url_map

  load_balancing_scheme = local.lb_load_balancing_scheme
  backends              = local.lb_backends
}

resource "google_compute_url_map" "ml-stg-dev" {
  name            = local.lb_name
  default_service = module.ml-non-prod-lb.backend_services["chatcdp-dev"].self_link

  host_rule {
    hosts        = ["dev-ml.hyly.us"]
    path_matcher = "dev-ml"
  }

  path_matcher {
    name            = "dev-ml"
    default_service = module.ml-non-prod-lb.backend_services["chatcdp-dev"].self_link

    route_rules {
      match_rules {
        prefix_match = "/chatcdp_services"
      }
      service  = module.ml-non-prod-lb.backend_services["chatcdp-services-dev"].self_link
      priority = 1
      route_action {
        url_rewrite {
          path_prefix_rewrite = "/"
        }
      }
    }

    route_rules {
      match_rules {
        prefix_match = "/chatcdp"
      }
      service  = module.ml-non-prod-lb.backend_services["chatcdp-dev"].self_link
      priority = 2
      route_action {
        url_rewrite {
          path_prefix_rewrite = "/"
        }
      }
    }

    route_rules {
      match_rules {
        prefix_match = "/hayleygpt"
      }
      service  = module.ml-non-prod-lb.backend_services["hayleygpt-dev"].self_link
      priority = 3
      route_action {
        url_rewrite {
          path_prefix_rewrite = "/"
        }
      }
    }

    route_rules {
      match_rules {
        prefix_match = "/mailBot"
      }
      service  = module.ml-non-prod-lb.backend_services["mailbot-dev"].self_link
      priority = 4
      route_action {
        url_rewrite {
          path_prefix_rewrite = "/"
        }
      }
    }

    route_rules {
      match_rules {
        prefix_match = "/hylyvoice"
      }
      service  = module.ml-non-prod-lb.backend_services["hylyvoice-dev"].self_link
      priority = 5
      route_action {
        url_rewrite {
          path_prefix_rewrite = "/"
        }
      }
    }
    route_rules {
      match_rules {
        prefix_match = "/hylyimageclassification"
      }
      service  = module.ml-non-prod-lb.backend_services["hylyimageclassification-dev"].self_link
      priority = 6
      route_action {
        url_rewrite {
          path_prefix_rewrite = "/"
        }
      }
    }
    route_rules {
      match_rules {
        prefix_match = "/oneminutechatbot"
      }
      service  = module.ml-non-prod-lb.backend_services["oneminutechatbot-dev"].self_link
      priority = 7
      route_action {
        url_rewrite {
          path_prefix_rewrite = "/"
        }
      }
    }
  }

  host_rule {
    hosts        = ["stg-ml.hyly.us"]
    path_matcher = "stg-ml"
  }

  path_matcher {
    name            = "stg-ml"
    default_service = module.ml-non-prod-lb.backend_services["chatcdp-stg"].self_link

    route_rules {
      match_rules {
        prefix_match = "/chatcdp_services"
      }
      service  = module.ml-non-prod-lb.backend_services["chatcdp-services-stg"].self_link
      priority = 1
      route_action {
        url_rewrite {
          path_prefix_rewrite = "/"
        }
      }
    }

    route_rules {
      match_rules {
        prefix_match = "/chatcdp"
      }
      service  = module.ml-non-prod-lb.backend_services["chatcdp-stg"].self_link
      priority = 2
      route_action {
        url_rewrite {
          path_prefix_rewrite = "/"
        }
      }
    }

    route_rules {
      match_rules {
        prefix_match = "/hayleygpt"
      }
      service  = module.ml-non-prod-lb.backend_services["hayleygpt-stg"].self_link
      priority = 3
      route_action {
        url_rewrite {
          path_prefix_rewrite = "/"
        }
      }
    }

    route_rules {
      match_rules {
        prefix_match = "/mailBot"
      }
      service  = module.ml-non-prod-lb.backend_services["mailbot-stg"].self_link
      priority = 4
      route_action {
        url_rewrite {
          path_prefix_rewrite = "/"
        }
      }
    }

    route_rules {
      match_rules {
        prefix_match = "/hylyvoice"
      }
      service  = module.ml-non-prod-lb.backend_services["hylyvoice-stg"].self_link
      priority = 5
      route_action {
        url_rewrite {
          path_prefix_rewrite = "/"
        }
      }
    }

    route_rules {
      match_rules {
        prefix_match = "/hylyimageclassification"
      }
      service  = module.ml-non-prod-lb.backend_services["hylyimageclassification-stg"].self_link
      priority = 6
      route_action {
        url_rewrite {
          path_prefix_rewrite = "/"
        }
      }
    }

  }
}

resource "google_compute_instance_group" "staging_dev" {
  name        = "staging-dev-webserver"
  description = "Group for staging and dev environment of Hyly ML stack"

  instances = [
    google_compute_instance.staging_dev.id,
  ]

  named_port {
    name = "chatcdp-dev"
    port = "5000"
  }

  named_port {
    name = "hylyimageclassification-dev"
    port = "5040"
  }

  named_port {
    name = "oneminutechatbot-dev"
    port = "8000"
  }
  named_port {
    name = "chatcdp-services-dev"
    port = "5010"
  }

  named_port {
    name = "hayleygpt-dev"
    port = "5005"
  }

  named_port {
    name = "chatcdp-stg"
    port = "5001"
  }

  named_port {
    name = "chatcdp-services-stg"
    port = "5011"
  }

  named_port {
    name = "hayleygpt-stg"
    port = "5006"
  }

  named_port {
    name = "mailbot-dev"
    port = "5015"
  }

  named_port {
    name = "mailbot-stg"
    port = "5016"
  }

  named_port {
    name = "hylyvoice-dev"
    port = "8501"
  }

  named_port {
    name = "hylyvoice-stg"
    port = "8502"
  }

  named_port {
    name = "hylyimageclassification-stg"
    port = "5041"
  }

  lifecycle {
    create_before_destroy = true
  }

  zone = local.zone
}