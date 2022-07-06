# Represents a Discord message reference
class_name MessageReference extends Dataclass

var message_id = null # [String] Id of the originating message
var channel_id = null # [String] Id of the originating message's channel
var guild_id = null # [String] Id of the originating message's guild
var fail_if_not_exists: bool = true # When sending, whether to error if the referenced message doesn't exist instead of sending as a normal (non-reply) message, default true


# @hidden
func _init().("MessageReference"): return self
