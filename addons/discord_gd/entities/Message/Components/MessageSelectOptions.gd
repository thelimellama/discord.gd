# Represents a Discord message select option
class_name MessageSelectOption extends Dataclass

var label: String # The user-facing name of the option, max 100 characters
var value: String # The dev-defined value of the option, max 100 characters
var description = null # [String] An additional description of the option, max 100 characters
var emoji = null # Partial [Emoji]: id, name, and animated
var default = null # [bool] Will render this option as selected by default


# @hidden
func _init().("MessageSelectOption"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("emoji"):
		self.emoji = Emoji.new().from_dict(p_dict.emoji)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict().duplicate(true)

	if dict.has("emoji"):
		dict.emoji = self.emoji.to_dict()

	return dict
