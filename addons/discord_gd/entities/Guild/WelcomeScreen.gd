# Represents a Discord welcome screen
class_name WelcomeScreen extends Dataclass

var description = null # [String] The server description shown in the welcome screen
var welcome_channels: Array # [Array] of [WelcomeScreenChannel] The channels shown in the welcome screen, up to 5


# @hidden
func _init().("WelcomeScreen"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	welcome_channels = []
	if p_dict.has("welcome_channels"):
		for data in p_dict.welcome_channels:
			welcome_channels.append(WelcomeScreenChannel.new().from_dict(data))

	return self