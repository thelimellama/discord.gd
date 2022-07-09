# Represents a Discord message select menu
#
# - Select menus must be sent inside an Action Row
# - An Action Row can contain only one select menu
# - An Action Row containing a select menu cannot also contain buttons
class_name MessageSelectMenu extends DiscordDataclass

var type: int = 3 # 3 for a select menu
var custom_id: String # A developer-defined identifier for the select menu, max 100 characters
var options: Array # [Array] of [MessageSelectOption] The choices in the select, max 25
var placeholder = null # [String] Custom placeholder text if nothing is selected, max 150 characters `optional`
var min_values = null # [int] The minimum number of items that must be chosen; default 1, min 0, max 25 `optional`
var max_values = null # [int] The maximum number of items that can be chosen; default 1, max 25 `optional`
var disabled = null # [bool] Disable the select, default false `optional`


# @hidden
func _init().("MessageSelectMenu"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("options"):
		options = []
		for data in p_dict.options:
			options.append(MessageSelectOption.new().from_dict(data))

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_array_dataclass_to_dict(dict, "options")

	return dict
