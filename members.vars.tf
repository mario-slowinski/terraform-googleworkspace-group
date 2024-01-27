variable "members" {
  type = list(object({
    email             = string           # The member's email address. A member can be a user or another group.
    delivery_settings = optional(string) # Defines mail delivery preferences of member.
    role              = optional(string) # The member's role in a group.
    type              = optional(string) # The type of group member.
  }))
  description = "List of Google Workspace Groups Members."
  default     = [{ email = null }]
  validation {
    condition = alltrue(concat(
      [
        for member in var.members :
        contains(
          [
            "ALL_MAIL", # All messages, delivered as soon as they arrive.
            "DAILY",    # No more than one message a day.
            "DIGEST",   # Up to 25 messages bundled into a single message.
            "DISABLED", # Remove subscription.
            "NONE",     # No messages.
          ],
          member.delivery_settings != null ? member.delivery_settings : "ALL_MAIL"
        )
      ],
      [
        for member in var.members :
        contains(
          [
            "MANAGER", # This role is only available if the Google Groups for Business is enabled using the Admin Console. A MANAGER role can do everything done by an OWNER role except make a member an OWNER or delete the group. A group can have multiple MANAGER members.
            "MEMBER",  # This role can subscribe to a group, view discussion archives, and view the group's membership list.
            "OWNER",   # This role can send messages to the group, add or remove members, change member roles, change group's settings, and delete the group. A group can have more than one OWNER.
          ],
          member.role != null ? member.role : "MEMBER"
        )
      ],
      [
        for member in var.members :
        contains(
          [
            "CUSTOMER", # The member represents all users in a domain.
            "GROUP",    # The member is another group.
            "USER",     # The member is a user.
          ],
          member.type != null ? member.type : "USER"
        )
      ],
    ))
    error_message = <<EOT
Possible values are:
  delivery_settings:
    ALL_MAIL (default)
    DAILY
    DIGEST
    DISABLED
    NONE
  role:
    MANAGER
    MEMBER (default)
    OWNER
  type:
    CUSTOMER
    GROUP
    USER (default)
EOT
  }
}
