variable "gitlab_token" {
  type        = string
  description = "Gitlab token."
}

variable "org_name" {
  type        = string
  description = "Gitlab organization name."
}

variable "org_path" {
  type        = string
  description = "Gitlab organization path."
}

variable "org_description" {
  type        = string
  default     = ""
  description = "Gitlab organization description."
}

variable "groups" {
  type = map(object({
    description = string
  }))
  description = "Gitlab groups."
  default     = {}
}

variable "members" {
  type = map(object({
    access = string
  }))
  description = "Gitlab members."
  default     = {}
}

variable "repositories" {
  type = map(object({
    group       = string
    description = string
  }))
  description = "Gitlab repositories."
  default     = {}
}

variable "labels" {
  type = map(object({
    description = string
    color       = string
  }))
  description = "Gitlab labels."
  default     = {}
}
