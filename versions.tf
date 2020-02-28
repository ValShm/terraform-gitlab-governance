terraform {
  required_version = "~> 0.12"

  required_providers {
    gitlab = "~> 2.5"
  }
}

provider "gitlab" {
  token = var.gitlab_token
}
