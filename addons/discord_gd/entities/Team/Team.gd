# Represents a Discord team
class_name Team extends Dataclass

var icon = null # [String] A hash of the image of the team's icon
var id: String # The unique id of the team
var members: Array # [Array] of [TeamMember] The members of the team
var name: String # The name of the team
var owner_user_id: String # The user id of the current team owner


# @hidden
func _init().("Team"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	members = []
	if p_dict.has("members"):
		for data in p_dict.members:
			members.append(TeamMember.new().from_dict(data))

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict().duplicate(true)

	if dict.has("members"):
		for i in dict.members.size():
			dict.members[i] = dict.members[i].to_dict()

	return dict
