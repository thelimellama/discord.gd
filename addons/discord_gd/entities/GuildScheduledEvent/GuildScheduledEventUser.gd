# Represents a Discord guild scheduled event user
class_name GuildScheduledEventUser extends Dataclass

var guild_scheduled_event_id: String # The scheduled event id which the user subscribed to
var user: User # User which subscribed to an event
var member = null # [GuildMember] Guild member data for this user for the guild which this event belongs to, if any

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
	var dict = .to_dict().duplicate(true)

	if dict.has("user") and dict.user != null:
		dict.user = dict.user.to_dict()
	if dict.has("member") and dict.member != null:
		dict.member = dict.member.to_dict()

	return dict
