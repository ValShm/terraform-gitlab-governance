# terraform-gitlab-governance

This modudle helps setup a governance to a Gitlab organization.

This module is part of the collection of Terraform modules used in Cuemby. They are constantly updated primary for our internal team and of course help from the community is always welcome.

## How to use it.

```terraform
module "gitlab" {
  source = "cuemby/gitlab-governance"

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
```
