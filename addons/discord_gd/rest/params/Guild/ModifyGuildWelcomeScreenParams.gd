# Params for modify guild welcome screen
class_name ModifyGuildWelcomeScreenParams extends Dataclass

var enabled = null # [bool] Whether the welcome screen is enabled
var welcome_channels = null # [Array] of [WelcomeScreenChannel] Channels linked in the welcome screen and their display options
var description = null # [String] The server description to show in the welcome screen

# @hidden
func _init().("ModifyGuildWelcomeScreenParams", {include_null_in_dict = true}): return self


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
	var dict = .to_dict().duplicate(true)

	if dict.has("welcome_channels") and dict.welcome_channels != null:
		for i in dict.welcome_channels.size():
			dict.welcome_channels[i] = dict.welcome_channels[i].to_dict()

	return dict
