variable "email" {
  type        = string
  description = "The group's email address. If your account has multiple domains,select the appropriate domain for the email address. The email must be unique."
  default     = null
}

variable "aliases" {
  type        = list(string)
  description = "List of group's email addresses."
  default     = null
}

variable "description" {
  type        = string
  description = "An extended description to help users determine the purpose of a group."
  default     = null
}

variable "name" {
  type        = string
  description = "The group's display name."
  default     = null
}
