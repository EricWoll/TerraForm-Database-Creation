terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.60.0"
    }
  }
}
provider "google" {
  project = "byui-cit326-project-eric"
}

# postgresql databases

// dev
resource "google_sql_database" "dev_postgresql_db" {
    name ="postgresql-woll-dev-db"
    instance = google_sql_database_instance.postgresql_instance.name
}
// int
resource "google_sql_database" "int_postgresql_db" {
    name ="postgresql-woll-int-db"
    instance = google_sql_database_instance.postgresql_instance.name
}
// qa
resource "google_sql_database" "qa_postgresql_db" {
    name ="postgresql-woll-aq-db"
    instance = google_sql_database_instance.postgresql_instance.name
}

# postgresql instance

resource "google_sql_database_instance" "postgresql_instance" {
  name             = "postgresql-woll-instance"
  database_version = "POSTGRES_15"
  region           = "us-central1"

  settings {
    tier = "db-f1-micro"
  }
  deletion_protection  = "false"
}

# postgresql users

// dev
resource "google_sql_user" "postgresql_dev_user" {
  name     = "postgresql-dev-user"
  instance = google_sql_database_instance.postgresql_instance.name
  password = "password"
}
// int
resource "google_sql_user" "postgresql_int_user" {
  name     = "postgresql-int-user"
  instance = google_sql_database_instance.postgresql_instance.name
  password = "password"
}
// qa
resource "google_sql_user" "postgresql_qa_user" {
  name     = "postgresql-qa-user"
  instance = google_sql_database_instance.postgresql_instance.name
  password = "password"
}


# mysql databases

// dev
resource "google_sql_database" "dev_mysql_db" {
    name ="mysql-woll-dev-db"
    instance = google_sql_database_instance.mysql_instance.name
}
// int
resource "google_sql_database" "int_mysql_db" {
    name ="mysql-woll-int-db"
    instance = google_sql_database_instance.mysql_instance.name
}
//qa
resource "google_sql_database" "qa_mysql_db" {
    name ="mysql-woll-aq-db"
    instance = google_sql_database_instance.mysql_instance.name
}

# mysql instance

resource "google_sql_database_instance" "mysql_instance" {
    name = "mysql-woll-instance"
    database_version = "MYSQL_8_0"
    region = "us-central1"
    
    settings {
        tier = "db-f1-micro"
    }

    deletion_protection  = "false"
}

# mysql users

// dev
resource "google_sql_user" "mysql_dev_user" {
  name     = "mysql-dev-user"
  instance = google_sql_database_instance.mysql_instance.name
  password = "password"
}
// int
resource "google_sql_user" "mysql_int_user" {
  name     = "mysql-int-user"
  instance = google_sql_database_instance.mysql_instance.name
  password = "password"
}
// qa
resource "google_sql_user" "mysql_qa_user" {
  name     = "mysql-qa-user"
  instance = google_sql_database_instance.mysql_instance.name
  password = "password"
}