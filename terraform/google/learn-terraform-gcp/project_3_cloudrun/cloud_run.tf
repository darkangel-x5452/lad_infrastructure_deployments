resource "google_cloud_run_service_iam_member" "public_invoker" {
  location = google_cloud_run_v2_service.cloud_run_terraform.location
  project  = google_cloud_run_v2_service.cloud_run_terraform.project
  service  = google_cloud_run_v2_service.cloud_run_terraform.name

  role   = "roles/run.invoker"
  member = "allUsers"
}

resource "google_cloud_run_v2_service" "cloud_run_terraform" {
  name     = var.cloud_run_name
  location = var.region
  # Allowing deletion because it is only temporary build.
  deletion_protection=false
  #   deletion_protection  = var.deletion_protection
  #   launch_stage         = "GA"
  ingress = "INGRESS_TRAFFIC_ALL"
  #   default_uri_disabled = true

  # Public website through the allowed ingress. This is NOT application login.
  # The load balancer does not automatically send a Google user identity token.
  #   invoker_iam_disabled = true

  scaling {
    min_instance_count = var.min_instances
    max_instance_count = var.max_instances
  }

  template {
    # service_account                  = google_service_account.runtime.email
    # execution_environment            = "EXECUTION_ENVIRONMENT_GEN2"
    timeout                          = "60s"
    max_instance_request_concurrency = var.concurrency

    containers {
      name  = "examplehello"
      image = var.image
      ports {
        container_port = 8080
      }
      resources {
        limits = {
          cpu    = "1"
          memory = "1Gi"
        }
        cpu_idle          = true
        startup_cpu_boost = true
      }
      startup_probe {
        initial_delay_seconds = 0
        timeout_seconds       = 1
        period_seconds        = 3
        failure_threshold     = 1
        tcp_socket {
          port = 8080
        }
      }
      liveness_probe {
        timeout_seconds   = 2
        period_seconds    = 30
        failure_threshold = 3
        http_get {
          path = "/"
          port = 8080
        }
      }
    }
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }

  depends_on = [
    google_project_service.cloud_run_api
  ]

}
