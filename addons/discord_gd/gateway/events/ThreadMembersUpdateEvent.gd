# Represents a Discord thread members update event
class_name ThreadMembersUpdateEvent extends Dataclass

var id: String # The id of the thread
var guild_id: String # The id of the guild
var member_count: int # The approximate number of members in the thread, capped at 50
var added_members = null # [Array] of [ThreadMember] The users who were added to the thread `optional`
var removed_member_ids = null # [Array] of [String] The id of the users who were removed from the thread `optional`

# @hidden
func _init().("ThreadMembersUpdateEvent"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("added_members"):
		added_members = []
		for data in p_dict.added_members:
			added_members.append(ThreadMember.new().from_dict(data))

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_array_dataclass_to_dict(dict, "added_members")

	return dict
