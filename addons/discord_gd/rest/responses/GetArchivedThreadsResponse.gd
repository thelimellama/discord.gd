# Response for get archived threads
class_name GetArchivedThreadsResponse extends Dataclass

var threads: Array # [Array] of [Channel] The public/private archived threads
var members: Array # [Array] of [ThreadMembers] A thread member object for each returned thread the current user has joined
var has_more: bool # Whether there are potentially additional threads that could be returned on a subsequent call


# @hidden
func _init().("GetArchivedThreadsResponse"): return self


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
	var dict = .to_dict().duplicate(true)

	if dict.has("threads"):
		for i in dict.threads.size():
			dict.threads[i] = dict.threads[i].to_dict()
	if dict.has("members"):
		for i in dict.members.size():
			dict.members[i] = dict.members[i].to_dict()

	return dict
