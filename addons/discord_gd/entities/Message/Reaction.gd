# Represents a Discord reaction
class_name Reaction extends Dataclass

var count: int # Times this emoji has been used to react
var me: bool # Whether the current user reacted using this emoji
var emoji: Emoji # Partial [Emoji] Emoji information


# @hidden
func _init().("Reaction"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	emoji = Emoji.new().from_dict(p_dict.emoji)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict().duplicate(true)

	dict.emoji = dict.emoji.to_dict()

	return dict
