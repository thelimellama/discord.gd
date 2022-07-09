# Represents a Discord message reference
class_name MessageReference extends DiscordDataclass

var message_id = null # [String] Id of the originating message `optional`
var channel_id = null # [String] Id of the originating message's channel `optional`
var guild_id = null # [String] Id of the originating message's guild `optional`
var fail_if_not_exists = null # [bool] When sending, whether to error if the referenced message doesn't exist instead of sending as a normal (non-reply) message, default is true `optional`


# @hidden
func _init().("MessageReference"): return self
