# Represents a Discord followed channel
class_name FollowedChannel extends DiscordDataclass

var channel_id: String # Source channel id
var webhook_id: String # Created target webhook id

# @hidden
func _init().("FollowedChannel"): return self
