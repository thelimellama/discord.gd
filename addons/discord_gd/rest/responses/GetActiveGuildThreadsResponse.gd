# Response for get active guild threads
class_name GetActiveGuildThreadsResponse extends DiscordDataclass

var threads: Array # [Array] of [Channel] The public/private archived threads
var members: Array # [Array] of [ThreadMembers] A thread member object for each returned thread the current user has joined


# @hidden
func _init().("GetActiveGuildThreadsResponse"): return self


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
