# Represents a Discord message button
#
# - Non-link buttons must have a `custom_id`, and cannot have a `url`
# - Link buttons must have a `url`, and cannot have a `custom_id`
class_name MessageButton extends Dataclass

var type: int = 2 # 2 for a button
var style: int # One of [MessageButtonStyles]
var label = null # [String] Text that appears on the button, max 80 characters
var emoji = null # Partial [Emoji]: name, id, and animated
var custom_id = null # [String] A developer-defined identifier for the button, max 100 characters
var url = null # [String] A url for link-style buttons
var disabled = null # [bool] Whether the button is disabled (default false)


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
	var dict = .to_dict().duplicate(true)

	if dict.has("emoji") and dict.emoji != null:
		dict.emoji = dict.emoji.to_dict()

	return dict
