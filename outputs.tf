output "groups" {
  value = gitlab_group.groups.*
}

output "members" {
  value = data.gitlab_user.members.*
}

output "repositories" {
  value = gitlab_project.repositories.*
}

output "labels" {
  value = gitlab_group_label.labels.*
}
