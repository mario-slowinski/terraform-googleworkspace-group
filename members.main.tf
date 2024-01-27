resource "googleworkspace_group_member" "email" {
  for_each = { for member in var.members : member.email => member if member.email != null }

  group_id          = googleworkspace_group.email[var.email].id
  delivery_settings = each.value.delivery_settings
  email             = each.value.email
  role              = each.value.role
  type              = each.value.type
}
