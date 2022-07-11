# Represents a Discord update presence event
#
# Sent by the client to indicate a presence or status update
class_name UpdatePresenceEvent extends DiscordDataclass

var since = null setget __set_since # [int] Unix time (in milliseconds) of when the client went idle, or null if the client is not idle `nullable`
var activities: Array # [Array] of [Activity] The user's activities
var status: String # [StatusTypes] The user's new status
var afk: bool # Whether or not the client is afk


# @hidden
func _init().("UpdatePresenceEvent"): return self


func __set_since(p_since):
	__options__.set_props.since = true
	since = p_since


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("activities"):
		activities = []
		for activity in p_dict.activities:
			activities.append(Activity.new().from_dict(activity))

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_array_dataclass_to_dict(dict, "activities")

	return dict
