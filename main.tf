resource "gitlab_group" "org" {
  name        = var.org_name
  path        = var.org_path
  description = var.org_description
}

resource "gitlab_group" "groups" {
  for_each = var.groups

  path        = each.key
  parent_id   = gitlab_group.org.id
  name        = lookup(each.value, "name", each.key)
  description = lookup(each.value, "description", "")
}

data "gitlab_user" "members" {
  for_each = var.members
  username = each.key
}

resource "gitlab_group_membership" "members_access" {
  for_each = data.gitlab_user.members

  group_id     = gitlab_group.org.id
  user_id      = lookup(each.value, "id")
  access_level = lookup(var.members[each.key], "access", "guest")
}

resource "gitlab_project" "repositories" {
  for_each = var.repositories

  path           = each.key
  name           = lookup(each.value, "name", each.key)
  description    = lookup(each.value, "description", "")
  default_branch = lookup(each.value, "default_branch", "master")
  namespace_id   = lookup(gitlab_group.groups[lookup(each.value, "group")], "id")
}

resource "gitlab_group_label" "labels" {
  for_each = var.labels

  name        = each.key
  group       = gitlab_group.org.id
  color       = lookup(each.value, "color")
  description = lookup(each.value, "description")
}
