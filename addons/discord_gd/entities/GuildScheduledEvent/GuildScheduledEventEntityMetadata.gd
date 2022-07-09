# Represents a Discord guild scheduled event entity metdata object
#
# `location` is required when `entity_type` is `EXTERNAL`
class_name GuildScheduledEventEntityMetadata extends DiscordDataclass

var location = null # [String] Location of the event (1-100 characters) `optional`


# @hidden
func _init().("GuildScheduledEventEntityMetadata"): return self
