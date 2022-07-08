# Represents a Discord guild widget settings
class_name GuildWidgetSettings extends Dataclass

var enabled: bool # Whether the widget is enabled
var channel_id = null setget __set_channel_id # [String] The widget channel id

var __set_props = {} # @hidden


# @hidden
func _init().("GuildWidgetSettings", {print_exclude = ["__set_props"]}): return self


func __set_channel_id(p_channel_id):
	__set_props.channel_id = true
	channel_id = p_channel_id


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()
	var set_props = __set_props.keys()
	for prop in set_props: dict[prop] = get(prop)
	dict = dict.duplicate(true)
	dict.erase("__set_props")

	return dict
