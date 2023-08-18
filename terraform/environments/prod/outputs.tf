output "sql_db_uri" {
  value = "${google_sql_database.hylyml_sql_db.self_link}"
}

output "sql_db_instance_uri" {
  value = "${google_sql_database_instance.hylyml_sql_db_instance.self_link}"
}

output "sql_db_instance_connection_name" {
  value = "${google_sql_database_instance.hylyml_sql_db_instance.connection_name}"
}

output "redis_host" {
 description = "The IP address of the redis instance."
 value = "${google_redis_instance.hylyml_redis.host}"
}