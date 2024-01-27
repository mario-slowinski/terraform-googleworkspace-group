resource "googleworkspace_group" "email" {
  for_each = var.email != null ? toset([var.email]) : toset([])

  email       = var.email
  aliases     = var.aliases
  description = var.description
  name        = var.name
}
