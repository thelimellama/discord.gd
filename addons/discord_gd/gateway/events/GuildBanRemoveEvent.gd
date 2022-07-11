# Represents a Discord guild ban remove event
class_name GuildBanRemoveEvent extends Dataclass

var guild_id: String # Id of the guild
var user: User # [User] The unbanned user

# @hidden
func _init().("GuildBanRemoveEvent"): return self


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
