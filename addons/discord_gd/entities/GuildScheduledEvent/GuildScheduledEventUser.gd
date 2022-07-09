# Represents a Discord guild scheduled event user
class_name GuildScheduledEventUser extends DiscordDataclass

var guild_scheduled_event_id: String # The scheduled event id which the user subscribed to
var user: User # User which subscribed to an event
var member = null # [GuildMember] Guild member data for this user for the guild which this event belongs to, if any `optional`

# @hidden
func _init().("GuildScheduledEventUser"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("user"):
		user = User.new().from_dict(p_dict.user)
	if p_dict.has("member") and p_dict.member != null:
		member = GuildMember.new().from_dict(p_dict.member)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_dataclass_to_dict(dict, "user")
	DiscordUtils.try_dataclass_to_dict(dict, "member")

	return dict
