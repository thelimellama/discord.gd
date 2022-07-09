# Represents a Discord emoji
class_name Emoji extends DiscordDataclass

var id = null # [String] Emoji id `nullable`
var name = null # [String] (can be null only in reaction emoji objects)	Emoji name `nullable`
var roles = null # [Array] of [String] Roles allowed to use this emoji `optional`
var user = null # [User] User that created this emoji `optional`
var require_colons = null # [bool] Whether this emoji must be wrapped in colons `optional`
var managed = null # [bool] Whether this emoji is managed `optional`
var animated = null # [bool] Whether this emoji is animated `optional`
var available = null # [bool] Whether this emoji can be used, may be false due to loss of Server Boosts `optional`


# @hidden
func _init().("Emoji"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("user"):
		user = User.new().from_dict(p_dict.user)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_dataclass_to_dict(dict, "user")

	return dict
