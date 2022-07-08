# Represents a Discord guild ban
class_name GuildBan extends Dataclass

var reason = null # [String] The reason for the ban
var user: User # [User] The banned user

# @hidden
func _init().("GuildBan"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("user"):
		user = User.new().from_dict(p_dict.user)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict().duplicate(true)

	if dict.has("user") and dict.user != null:
		dict.user = dict.user.to_dict()

	return dict
