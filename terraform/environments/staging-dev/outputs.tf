output "public_ip_instance" {
  value = google_compute_instance.staging_dev.network_interface.0.access_config.0.nat_ip
}