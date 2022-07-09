# Represents a Discord message button
#
# - Non-link buttons must have a `custom_id`, and cannot have a `url`
# - Link buttons must have a `url`, and cannot have a `custom_id`
class_name MessageButton extends DiscordDataclass

var type: int = 2 # Type is 2 for a button
var style: int # One of [MessageButtonStyles]
var label = null # [String] Text that appears on the button, max 80 characters `optional`
var emoji = null # Partial [Emoji]: name, id, and animated `optional`
var custom_id = null # [String] A developer-defined identifier for the button, max 100 characters `optional`
var url = null # [String] A url for link-style buttons `optional`
var disabled = null # [bool] Whether the button is disabled (default false) `optional`


# @hidden
func _init().("MessageButton"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("emoji"):
		emoji = Emoji.new().from_dict(p_dict.emoji)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_dataclass_to_dict(dict, "emoji")

	return dict
