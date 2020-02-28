# terraform-gitlab-governance

This modudle helps setup a governance to a Gitlab organization.

## How to use it.

```terraform
module "gitlab" {
  source = "../../"

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
