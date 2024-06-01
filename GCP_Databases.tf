terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = "cedar-scope-416822"
}

resource "google_sql_database" "database-1" {
  name     = "my-database"
  instance = google_sql_database_instance.mysql-instance-1.name
}

resource "google_sql_database_instance" "mysql-instance-1" {
  name             = "mysql-akorede-development-db"
  region           = "us-central1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"

    ip_configuration {

      authorized_networks {
        name  = "test-connection"
        value = "0.0.0.0/0"
      }
    }
  }

  deletion_protection = "false"

}

resource "google_sql_user" "mysql-user-1" {
  name     = "mysql-dev-user"
  instance = google_sql_database_instance.mysql-instance-1.name
  password = "password"
}

resource "google_sql_database" "database-2" {
  name     = "my-database"
  instance = google_sql_database_instance.mysql-instance-2.name
}

resource "google_sql_database_instance" "mysql-instance-2" {
  name             = "mysql-akorede-integrationtest-db"
  region           = "us-central1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"

    ip_configuration {

      authorized_networks {
        name  = "test-connection"
        value = "0.0.0.0/0"
      }
    }
  }

  deletion_protection = "false"

}

resource "google_sql_user" "mysql-user-2" {
  name     = "mysql-int-user"
  instance = google_sql_database_instance.mysql-instance-2.name
  password = "password"
}

resource "google_sql_database" "database-3" {
  name     = "my-database"
  instance = google_sql_database_instance.mysql-instance-3.name
}

resource "google_sql_database_instance" "mysql-instance-3" {
  name             = "mysql-akorede-qa-db"
  region           = "us-central1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"

    ip_configuration {

      authorized_networks {
        name  = "test-connection"
        value = "0.0.0.0/0"
      }
    }
  }

  deletion_protection = "false"

}

resource "google_sql_user" "mysql-user-3" {
  name     = "mysql-qa-user"
  instance = google_sql_database_instance.mysql-instance-3.name
  password = "password"
}

resource "google_sql_database" "database-4" {
  name     = "my-database"
  instance = google_sql_database_instance.postgres-instance-1.name
}

resource "google_sql_database_instance" "postgres-instance-1" {
  name             = "postgres-akorede-development-db"
  region           = "us-central1"
  database_version = "POSTGRES_15"
  settings {
    tier = "db-f1-micro"

    ip_configuration {

      authorized_networks {
        name  = "test-connection"
        value = "0.0.0.0/0"
      }
    }
  }

  deletion_protection = "false"

}

resource "google_sql_user" "postgre-user-1" {
  name     = "postgre-dev-user"
  instance = google_sql_database_instance.postgres-instance-1.name
  password = "password"
}

resource "google_sql_database" "database-5" {
  name     = "my-database"
  instance = google_sql_database_instance.postgres-instance-2.name
}

resource "google_sql_database_instance" "postgres-instance-2" {
  name             = "postgres-akorede-integrationtest-db"
  region           = "us-central1"
  database_version = "POSTGRES_15"
  settings {
    tier = "db-f1-micro"

    ip_configuration {

      authorized_networks {
        name  = "test-connection"
        value = "0.0.0.0/0"
      }
    }
  }

  deletion_protection = "false"

}

resource "google_sql_user" "postgre-user-2" {
  name     = "postgre-int-user"
  instance = google_sql_database_instance.postgres-instance-2.name
  password = "password"
}

resource "google_sql_database" "database-6" {
  name     = "my-database"
  instance = google_sql_database_instance.postgres-instance-3.name
}

resource "google_sql_database_instance" "postgres-instance-3" {
  name             = "postgres-akorede-qa-db"
  region           = "us-central1"
  database_version = "POSTGRES_15"
  settings {
    tier = "db-f1-micro"

    ip_configuration {

      authorized_networks {
        name  = "test-connection"
        value = "0.0.0.0/0"
      }
    }
  }

  deletion_protection = "false"

}

resource "google_sql_user" "postgre-user-3" {
  name     = "postgre-qa-user"
  instance = google_sql_database_instance.postgres-instance-3.name
  password = "password"
}
