# Represents a Discord guild ban add event
class_name GuildBanAddEvent extends Dataclass

var guild_id: String # Id of the guild
var user: User # [User] The banned user

# @hidden
func _init().("GuildBanAddEvent"): return self


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
