variable "allow_external_members" {
  type        = bool
  description = "Identifies whether members external to your organization can join the group."
  default     = null # Defaults to false.
}

variable "allow_web_posting" {
  type        = bool
  description = "Allows posting from web. If true, allows any member to post to the group forum. If false, Members only use Gmail to communicate with the group."
  default     = null # Defaults to true.
}

variable "archive_only" {
  type        = bool
  description = "Allows the group to be archived only. If true, Group is archived and the group is inactive."
  default     = null # Defaults to false.
}

variable "custom_footer_text" {
  type        = string
  description = "Set the content of custom footer text. The maximum number of characters is 1,000."
  default     = null
}

variable "custom_reply_to" {
  type        = string
  description = "An email address used when replying to a message if the reply_to property is set to REPLY_TO_CUSTOM."
  default     = null
}

variable "default_message_deny_notification_text" {
  type        = string
  description = "When a message is rejected, this is text for the rejection notification sent to the message's author."
  default     = null
}

variable "enable_collaborative_inbox" {
  type        = bool
  description = "Specifies whether a collaborative inbox will remain turned on for the group."
  default     = null # Defaults to false.
}

variable "include_custom_footer" {
  type        = string
  description = "Whether to include custom footer."
  default     = null
}

variable "include_in_global_address_list" {
  type        = bool
  description = "Enables the group to be included in the Global Address List."
  default     = null # Defaults to true.
}

variable "is_archived" {
  type        = bool
  description = "Allows the Group contents to be archived. If true, archive messages sent to the group. If false, Do not keep an archive of messages sent to this group."
  default     = null # Defaults to false.
}

variable "members_can_post_as_the_group" {
  type        = bool
  description = "Enables members to post messages as the group. If true, group member can post messages using the group's email address instead of their own email address."
  default     = null # Defaults to false.
}

variable "message_moderation_level" {
  type        = string
  description = "Moderation level of incoming messages."
  default     = null
  validation {
    condition = contains(
      [
        "MODERATE_ALL_MESSAGES", # All messages are sent to the group owner's email address for approval. If approved, the message is sent to the group.
        "MODERATE_NON_MEMBERS",  # All messages from non group members are sent to the group owner's email address for approval. If approved, the message is sent to the group.
        "MODERATE_NEW_MEMBERS",  # All messages from new members are sent to the group owner's email address for approval. If approved, the message is sent to the group.
        "MODERATE_NONE",         # No moderator approval is required. Messages are delivered directly to the group.
      ],
      var.message_moderation_level != null ? var.message_moderation_level : "MODERATE_NONE"
    )
    error_message = "Possible values are: ${join(", ",
      [
        "MODERATE_ALL_MESSAGES", # All messages are sent to the group owner's email address for approval. If approved, the message is sent to the group.
        "MODERATE_NON_MEMBERS",  # All messages from non group members are sent to the group owner's email address for approval. If approved, the message is sent to the group.
        "MODERATE_NEW_MEMBERS",  # All messages from new members are sent to the group owner's email address for approval. If approved, the message is sent to the group.
        "<MODERATE_NONE>",       # No moderator approval is required. Messages are delivered directly to the group.
      ],
    )}."
  }
}

variable "primary_language" {
  type        = string
  description = "The primary language for group."
  default     = null
}

variable "reply_to" {
  type        = string
  description = "Specifies who receives the default reply."
  default     = null
  validation {
    condition = contains(
      [
        "REPLY_TO_CUSTOM",   # For replies to messages, use the group's custom email address.
        "REPLY_TO_SENDER",   # The reply sent to author of message.
        "REPLY_TO_LIST",     # This reply message is sent to the group.
        "REPLY_TO_OWNER",    # The reply is sent to the owner(s) of the group. This does not include the group's managers.
        "REPLY_TO_IGNORE",   # Group users individually decide where the message reply is sent.
        "REPLY_TO_MANAGERS", # This reply message is sent to the group's managers, which includes all managers and the group owner.
      ],
      var.reply_to != null ? var.reply_to : "REPLY_TO_IGNORE"
    )
    error_message = "Possible values are: ${join(", ",
      [
        "REPLY_TO_CUSTOM",   # For replies to messages, use the group's custom email address.
        "REPLY_TO_SENDER",   # The reply sent to author of message.
        "REPLY_TO_LIST",     # This reply message is sent to the group.
        "REPLY_TO_OWNER",    # The reply is sent to the owner(s) of the group. This does not include the group's managers.
        "<REPLY_TO_IGNORE>", # Group users individually decide where the message reply is sent.
        "REPLY_TO_MANAGERS", # This reply message is sent to the group's managers, which includes all managers and the group owner.
      ],
    )}."
  }
}

variable "send_message_deny_notification" {
  type        = bool
  description = "Allows a member to be notified if the member's message to the group is denied by the group owner."
  default     = null # Defaults to false.
}

variable "spam_moderation_level" {
  type        = string
  description = "Specifies moderation levels for messages detected as spam."
  default     = null
  validation {
    condition = contains(
      [
        "ALLOW",             # Post the message to the group.
        "MODERATE",          # Send the message to the moderation queue. This is the default.
        "SILENTLY_MODERATE", # Send the message to the moderation queue, but do not send notification to moderators.
        "REJECT",            # Immediately reject the message.
      ],
      var.spam_moderation_level != null ? var.spam_moderation_level : "MODERATE"
    )
    error_message = "Possible values are: ${join(", ",
      [
        "ALLOW",             # Post the message to the group.
        "<MODERATE>",        # Send the message to the moderation queue. This is the default.
        "SILENTLY_MODERATE", # Send the message to the moderation queue, but do not send notification to moderators.
        "REJECT",            # Immediately reject the message.
      ],
    )}."
  }
}

variable "who_can_assist_content" {
  type        = string
  description = "Specifies who can moderate metadata."
  default     = null
  validation {
    condition = contains(
      [
        "ALL_MEMBERS",
        "OWNERS_AND_MANAGERS",
        "MANAGERS_ONLY",
        "OWNERS_ONLY",
        "NONE",
      ],
      var.who_can_assist_content != null ? var.who_can_assist_content : "NONE"
    )
    error_message = "Possible values are: ${join(", ",
      [
        "ALL_MEMBERS",
        "OWNERS_AND_MANAGERS",
        "MANAGERS_ONLY",
        "OWNERS_ONLY",
        "<NONE>",
      ],
    )}."
  }
}

variable "who_can_contact_owner" {
  type        = string
  description = "Permission to contact owner of the group via web UI."
  default     = null
  validation {
    condition = contains(
      [
        "ALL_IN_DOMAIN_CAN_CONTACT",
        "ALL_MANAGERS_CAN_CONTACT",
        "ALL_MEMBERS_CAN_CONTACT",
        "ANYONE_CAN_CONTACT",
        "ALL_OWNERS_CAN_CONTACT",
      ],
      var.who_can_contact_owner != null ? var.who_can_contact_owner : "ANYONE_CAN_CONTACT"
    )
    error_message = "Possible values are: ${join(", ",
      [
        "ALL_IN_DOMAIN_CAN_CONTACT",
        "ALL_MANAGERS_CAN_CONTACT",
        "ALL_MEMBERS_CAN_CONTACT",
        "<ANYONE_CAN_CONTACT>",
        "ALL_OWNERS_CAN_CONTACT",
      ],
    )}."
  }
}

variable "who_can_discover_group" {
  type        = string
  description = "Specifies the set of users for whom this group is discoverable."
  default     = null
  validation {
    condition = contains(
      [
        "ANYONE_CAN_DISCOVER",
        "ALL_IN_DOMAIN_CAN_DISCOVER",
        "ALL_MEMBERS_CAN_DISCOVER",
      ],
      var.who_can_discover_group != null ? var.who_can_discover_group : "ALL_IN_DOMAIN_CAN_DISCOVER"
    )
    error_message = "Possible values are: ${join(", ",
      [
        "ANYONE_CAN_DISCOVER",
        "<ALL_IN_DOMAIN_CAN_DISCOVER>",
        "ALL_MEMBERS_CAN_DISCOVER",
      ],
    )}."
  }
}

variable "who_can_join" {
  type        = string
  description = "Permission to join group."
  default     = null
  validation {
    condition = contains(
      [
        "ANYONE_CAN_JOIN",        # Any Internet user, both inside and outside your domain, can join the group.
        "ALL_IN_DOMAIN_CAN_JOIN", # Anyone in the account domain can join. This includes accounts with multiple domains.
        "INVITED_CAN_JOIN",       # Candidates for membership can be invited to join.
        "CAN_REQUEST_TO_JOIN",    # Non members can request an invitation to join.
      ],
      var.who_can_join != null ? var.who_can_join : "CAN_REQUEST_TO_JOIN"
    )
    error_message = "Possible values are: ${join(", ",
      [
        "ANYONE_CAN_JOIN",        # Any Internet user, both inside and outside your domain, can join the group.
        "ALL_IN_DOMAIN_CAN_JOIN", # Anyone in the account domain can join. This includes accounts with multiple domains.
        "INVITED_CAN_JOIN",       # Candidates for membership can be invited to join.
        "<CAN_REQUEST_TO_JOIN>",  # Non members can request an invitation to join.
      ],
    )}."
  }
}

variable "who_can_leave_group" {
  type        = string
  description = "Permission to leave the group."
  default     = null
  validation {
    condition = contains(
      [
        "ALL_MANAGERS_CAN_LEAVE",
        "ALL_MEMBERS_CAN_LEAVE",
        "NONE_CAN_LEAVE",
      ],
      var.who_can_leave_group != null ? var.who_can_leave_group : "ALL_MEMBERS_CAN_LEAVE"
    )
    error_message = "Possible values are: ${join(", ",
      [
        "ALL_MANAGERS_CAN_LEAVE",
        "<ALL_MEMBERS_CAN_LEAVE>",
        "NONE_CAN_LEAVE",
      ],
    )}."
  }
}

variable "who_can_moderate_content" {
  type        = string
  description = "Permission to join group."
  default     = null
  validation {
    condition = contains(
      [
        "ALL_MEMBERS",
        "OWNERS_AND_MANAGERS",
        "OWNERS_ONLY",
        "NONE",
      ],
      var.who_can_moderate_content != null ? var.who_can_moderate_content : "OWNERS_AND_MANAGERS"
    )
    error_message = "Possible values are: ${join(", ",
      [
        "ALL_MEMBERS",
        "<OWNERS_AND_MANAGERS>",
        "OWNERS_ONLY",
        "NONE",
      ],
    )}."
  }
}

variable "who_can_moderate_members" {
  type        = string
  description = "Specifies who can manage members."
  default     = null
  validation {
    condition = contains(
      [
        "ALL_MEMBERS",
        "OWNERS_AND_MANAGERS",
        "OWNERS_ONLY",
        "NONE",
      ],
      var.who_can_moderate_members != null ? var.who_can_moderate_members : "OWNERS_AND_MANAGERS"
    )
    error_message = "Possible values are: ${join(", ",
      [
        "ALL_MEMBERS",
        "<OWNERS_AND_MANAGERS>",
        "OWNERS_ONLY",
        "NONE",
      ],
    )}."
  }
}

variable "who_can_post_message" {
  type        = string
  description = "Permissions to post messages."
  default     = null
  validation {
    condition = contains(
      [
        "NONE_CAN_POST",          # The group is disabled and archived. No one can post a message to this group.
        "ALL_MANAGERS_CAN_POST",  # Managers, including group owners, can post messages.
        "ALL_MEMBERS_CAN_POST",   # Any group member can post a message.
        "ALL_OWNERS_CAN_POST",    # Only group owners can post a message.
        "ALL_IN_DOMAIN_CAN_POST", # Anyone in the account can post a message.
        "ANYONE_CAN_POST",        # Any Internet user who outside your account can access your Google Groups service and post a message.
      ],
      var.who_can_post_message != null ? var.who_can_post_message : "ALL_MEMBERS_CAN_POST"
    )
    error_message = "Possible values are: ${join(", ",
      [
        "NONE_CAN_POST",          # The group is disabled and archived. No one can post a message to this group.
        "ALL_MANAGERS_CAN_POST",  # Managers, including group owners, can post messages.
        "<ALL_MEMBERS_CAN_POST>", # Any group member can post a message.
        "ALL_OWNERS_CAN_POST",    # Only group owners can post a message.
        "ALL_IN_DOMAIN_CAN_POST", # Anyone in the account can post a message.
        "ANYONE_CAN_POST",        # Any Internet user who outside your account can access your Google Groups service and post a message.
      ],
    )}."
  }
}

variable "who_can_view_group" {
  type        = string
  description = "Permissions to view group messages."
  default     = null
  validation {
    condition = contains(
      [
        "ANYONE_CAN_VIEW",        # Any Internet user can view the group's messages.
        "ALL_IN_DOMAIN_CAN_VIEW", # Anyone in your account can view this group's messages.
        "ALL_MEMBERS_CAN_VIEW",   # All group members can view the group's messages.
        "ALL_MANAGERS_CAN_VIEW",  # Any group manager can view this group's messages.
        "ALL_OWNERS_CAN_VIEW",    # The group owners can view this group's messages.
      ],
      var.who_can_view_group != null ? var.who_can_view_group : "ALL_MEMBERS_CAN_VIEW"
    )
    error_message = "Possible values are: ${join(", ",
      [
        "ANYONE_CAN_VIEW",        # Any Internet user can view the group's messages.
        "ALL_IN_DOMAIN_CAN_VIEW", # Anyone in your account can view this group's messages.
        "<ALL_MEMBERS_CAN_VIEW>", # All group members can view the group's messages.
        "ALL_MANAGERS_CAN_VIEW",  # Any group manager can view this group's messages.
        "ALL_OWNERS_CAN_VIEW",    # The group owners can view this group's messages.
      ],
    )}."
  }
}

variable "who_can_view_membership" {
  type        = string
  description = "Permissions to view membership."
  default     = null
  validation {
    condition = contains(
      [
        "ALL_IN_DOMAIN_CAN_VIEW", # Anyone in the account can view the group members list.
        "ALL_MEMBERS_CAN_VIEW",   # The group members can view the group members list.
        "ALL_MANAGERS_CAN_VIEW",  # The group managers can view group members list.
        "ALL_OWNERS_CAN_VIEW",    # The group owners can view group members list.
      ],
      var.who_can_view_membership != null ? var.who_can_view_membership : "ALL_MEMBERS_CAN_VIEW"
    )
    error_message = "Possible values are: ${join(", ",
      [
        "ALL_IN_DOMAIN_CAN_VIEW",  # Anyone in the account can view the group members list.
        "ALL_MEMBERS_CAN_VIEW",    # The group members can view the group members list.
        "<ALL_MANAGERS_CAN_VIEW>", # The group managers can view group members list.
        "ALL_OWNERS_CAN_VIEW",     # The group owners can view group members list.
      ],
    )}."
  }
}
