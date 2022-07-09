# Represents a Discord team
class_name Team extends DiscordDataclass

var icon = null # [String] A hash of the image of the team's icon `nullable`
var id: String # The unique id of the team
var members: Array # [Array] of [TeamMember] The members of the team
var name: String # The name of the team
var owner_user_id: String # The user id of the current team owner


# @hidden
func _init().("Team"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("members"):
		members = []
		for data in p_dict.members:
			members.append(TeamMember.new().from_dict(data))

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_array_dataclass_to_dict(dict, "members")

	return dict
