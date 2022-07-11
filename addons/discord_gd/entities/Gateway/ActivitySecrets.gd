# Represents a Discord activity secrets
class_name ActivitySecrets extends Dataclass

var join = null # [String] The secret for joining a party `optional`
var spectate = null # [String] The secret for spectating a game `optional`
var match_ = null # [String] The secret for a specific instanced match (the underscore is because `match` is a Godot reserved word) `optional`


# @hidden
func _init().("ActivitySecrets"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("match"):
		match_ = p_dict.match

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	if dict.has("match_"):
		dict.match = dict.match_
		dict.erase("match_")

	return dict
