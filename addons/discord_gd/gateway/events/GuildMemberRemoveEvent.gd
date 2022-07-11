# Represents a Discord guild member remove event
class_name GuildMemberRemoveEvent extends Dataclass

var guild_id: String # The id of the guild
var user: User # [User] The user who was removed

# @hidden
func _init().("GuildMemberRemoveEvent"): return self


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
