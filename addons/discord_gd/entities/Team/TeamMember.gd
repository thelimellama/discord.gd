# Represents a Discord team member
class_name TeamMember extends DiscordDataclass

var membership_state: int # [TeamMembershipState] The user's membership state on the team
var permissions: Array # [Array] of [String] Will always be ["*"]
var team_id: String # The id of the parent team of which they are a member
var user: User # Partial [User] The avatar, discriminator, id, and username of the user


# @hidden
func _init().("TeamMember"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	user = User.new().from_dict(p_dict.user)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_dataclass_to_dict(dict, "user")

	return dict
