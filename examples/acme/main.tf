variable "gitlab_token" {
  type        = string
  description = "Gitlab personal token to use in the gitlab provider."
}

module "gitlab" {
  source  = "cuemby/governance/gitlab"
  version = "~> 0.1"

  gitlab_token = var.gitlab_token

  org_name        = "Acme"
  org_path        = "acme-org"
  org_description = "An awesome Acme organization."

  groups = {
    acme-group = {
      description = "This is an example of how create a group."
    }
  }

  repositories = {
    acme-repo = {
      group       = "acme-group"
      description = "This is an example how to create a repository inside a group."
    }
  }

  members = {}
  labels  = {}
}
