# Represents a Discord emoji
class_name Emoji extends Dataclass

var id = null # [String] Emoji id
var name = null # [String] (can be null only in reaction emoji objects)	Emoji name
var roles = null # [Array] of [String] Roles allowed to use this emoji
var user = null # [User] User that created this emoji
var require_colons = null # [bool] Whether this emoji must be wrapped in colons
var managed = null # [bool] Whether this emoji is managed
var animated = null # [bool] Whether this emoji is animated
var available = null # [bool] Whether this emoji can be used, may be false due to loss of Server Boosts


# @hidden
func _init().("Emoji"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("user"):
		user = User.new().from_dict(p_dict.user)

	return self