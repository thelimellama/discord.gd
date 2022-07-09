# Represents a Discord guild widget settings
class_name GuildWidgetSettings extends DiscordDataclass

var enabled: bool # Whether the widget is enabled
var channel_id = null setget __set_channel_id # [String] The widget channel id `nullable`

# @hidden
func _init().("GuildWidgetSettings"): return self


func __set_channel_id(p_channel_id):
	__options__.set_props.channel_id = true
	channel_id = p_channel_id
