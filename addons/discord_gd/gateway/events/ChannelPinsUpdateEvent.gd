# Represents a Discord channel pins update event
class_name ChannelPinsUpdateEvent extends Dataclass

var guild_id = null # [String] The id of the guild `optional`
var channel_id: String #  The id of the channel
var last_pin_timestamp = null # [String] The time at which the most recent pinned message was pinned `optional` `nullable`

# @hidden
func _init().("ChannelPinsUpdateEvent"): return self
