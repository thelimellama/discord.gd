# Represents a Discord update voice state event
#
# Sent when a client wants to join, move, or disconnect from a voice channel
class_name UpdateVoiceState extends DiscordDataclass

var guild_id: String # Id of the guild
var channel_id = null setget __set_channel_id # [String] Id of the voice channel client wants to join (`null` if disconnecting)
var self_mute: bool # Is the client muted
var self_deaf: bool # Is the client deafened


# @hidden
func _init().("UpdateVoiceState"): return self


func __set_channel_id(p_channel_id):
	__options__.set_props.channel_id = true
	channel_id = p_channel_id
