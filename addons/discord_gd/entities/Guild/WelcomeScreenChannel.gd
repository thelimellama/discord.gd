# Represents a Discord welcome screen channel
class_name WelcomeScreenChannel extends Dataclass

var channel_id: String # The channel's id
var description: String # The description shown for the channel
var emoji_id = null # [String] The emoji id, if the emoji is custom
var emoji_name = null # [String] The emoji name if custom, the unicode character if standard, or null if no emoji is set


# @hidden
func _init().("WelcomeScreenChannel"): return self
