output "sql_db_uri" {
  value = google_sql_database.hylyml_sql_db.self_link
}
output "sql_db_instance_uri" {
  value = google_sql_database_instance.hylyml_sql_db_instance.self_link
}
output "sql_db_instance_connection_name" {
  value = google_sql_database_instance.hylyml_sql_db_instance.connection_name
}
output "sql_db_public_ip" {
  value = google_sql_database_instance.hylyml_sql_db_instance.public_ip_address
}
output "redis_host" {
  description = "The IP address of the redis instance."
  value       = google_redis_instance.hylyml_redis.host
}
output "kubernetes_endpoint" {
  value = google_container_cluster.hyly_ml_cluster.endpoint
}
output "kubernetes_selflink" {
  value = google_container_cluster.hyly_ml_cluster.self_link
}
# Not required when using autopilot cluster created with google_container_cluster resource
/* output "service_account" {
  description = "The default service account used for running nodes."
  value       = module.gke.service_account
}
output "region" {
  description = "Cluster region"
  value       = module.gke.region
}
output "location" {
  description = "Cluster location (zones)"
  value       = module.gke.location
}
output "cluster_name" {
  description = "Cluster name"
  value       = module.gke.name
} */
# output "mongodb_connection_strings" {
#   value = mongodbatlas_cluster.hyly_ml_cluster.connection_strings
# }
# output "mongodb_connection_string_standard" {
#   value = mongodbatlas_cluster.hyly_ml_cluster.connection_strings[0].standard
# }
# output "mongodb_connection_string_standard_srv" {
#   value = mongodbatlas_cluster.hyly_ml_cluster.connection_strings[0].standard_srv
# }