# Represents a Discord thread list sync event
class_name ThreadListSyncEvent extends Dataclass

var guild_id: String # The id of the guild
var channel_ids = null # [Array] of [String] The parent channel ids whose threads are being synced. If omitted, then threads were synced for the entire guild. This array may contain channel_ids that have no active threads as well, so you know to clear that data.
var threads: Array # [Array] of [Channel] All active threads in the given channels that the current user can access
var members: Array # [Array] of [ThreadMember] All thread member objects from the synced threads for the current user, indicating which threads the current user has been added to


# @hidden
func _init().("ThreadListSyncEvent"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("threads"):
		threads = []
		for data in p_dict.threads:
			threads.append(Channel.new().from_dict(data))
	if p_dict.has("members"):
		members = []
		for data in p_dict.members:
			members.append(ThreadMember.new().from_dict(data))

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_array_dataclass_to_dict(dict, "threads")
	DiscordUtils.try_array_dataclass_to_dict(dict, "members")

	return dict
