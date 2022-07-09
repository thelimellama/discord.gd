# Params for modify guild welcome screen
class_name ModifyGuildWelcomeScreenParams extends DiscordDataclass

var enabled = null setget __set_enabled # [bool] Whether the welcome screen is enabled `optional` `nullable`
var welcome_channels = null setget __set_welcome_channels # [Array] of [WelcomeScreenChannel] Channels linked in the welcome screen and their display options `optional` `nullable`
var description = null setget __set_description # [String] The server description to show in the welcome screen `optional` `nullable`


# @hidden
func _init().("ModifyGuildWelcomeScreenParams"): return self


func __set_enabled(p_enabled):
	__options__.set_props.enabled = true
	enabled = p_enabled


func __set_welcome_channels(p_welcome_channels):
	__options__.set_props.welcome_channels = true
	welcome_channels = p_welcome_channels


func __set_description(p_description):
	__options__.set_props.description = true
	description = p_description


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("welcome_channels") and p_dict.welcome_channels != null:
		welcome_channels = []
		for data in p_dict.welcome_channels:
			welcome_channels.append(WelcomeScreenChannel.new().from_dict(data))

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_array_dataclass_to_dict(dict, "welcome_channels")

	return dict
