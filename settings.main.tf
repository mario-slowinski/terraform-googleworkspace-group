resource "googleworkspace_group_settings" "email" {
  for_each = var.email != null ? toset([var.email]) : toset([])

  email                                  = var.email
  allow_external_members                 = var.allow_external_members
  allow_web_posting                      = var.allow_web_posting
  archive_only                           = var.archive_only
  custom_footer_text                     = var.custom_footer_text
  custom_reply_to                        = var.custom_reply_to
  default_message_deny_notification_text = var.default_message_deny_notification_text
  enable_collaborative_inbox             = var.enable_collaborative_inbox
  include_custom_footer                  = var.include_custom_footer
  include_in_global_address_list         = var.include_in_global_address_list
  is_archived                            = var.is_archived
  members_can_post_as_the_group          = var.members_can_post_as_the_group
  message_moderation_level               = var.message_moderation_level
  primary_language                       = var.primary_language
  reply_to                               = var.reply_to
  send_message_deny_notification         = var.send_message_deny_notification
  spam_moderation_level                  = var.spam_moderation_level
  who_can_assist_content                 = var.who_can_assist_content
  who_can_contact_owner                  = var.who_can_contact_owner
  who_can_discover_group                 = var.who_can_discover_group
  who_can_join                           = var.who_can_join
  who_can_leave_group                    = var.who_can_leave_group
  who_can_moderate_content               = var.who_can_moderate_content
  who_can_moderate_members               = var.who_can_moderate_members
  who_can_post_message                   = var.who_can_post_message
  who_can_view_group                     = var.who_can_view_group
  who_can_view_membership                = var.who_can_view_membership
}
