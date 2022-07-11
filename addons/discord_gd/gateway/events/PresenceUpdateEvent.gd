# Represents a Discord presence update event
class_name PresenceUpdateEvent extends Dataclass


var user: User # The user presence is being updated for
var guild_id: String # Id of the guild
var status: String # One of [StatusTypes] except "invisible"
var activities: Array # [Array] of [Activity] User's current activities
var client_status: ClientStatus # User's platform-dependent status

# @hidden
func _init().("PresenceUpdateEvent"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("user"):
		user = User.new().from_dict(p_dict.user)
	if p_dict.has("activities"):
		activities = []
		for data in p_dict.activities:
			activities.append(Activity.new().from_dict(data))
	if p_dict.has("client_status"):
		client_status = ClientStatus.new().from_dict(p_dict.client_status)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_dataclass_to_dict(dict, "user")
	DiscordUtils.try_dataclass_to_dict(dict, "client_status")
	DiscordUtils.try_array_dataclass_to_dict(dict, "activities")

	return dict
