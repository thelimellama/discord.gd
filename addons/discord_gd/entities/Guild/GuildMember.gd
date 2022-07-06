# Represents a Discord guild member
class_name GuildMember extends Dataclass


var user = null # [User] The user this guild member represents
var nick = null # [String] This user's guild nickname
var avatar = null # [String] The member's guild avatar hash
var roles: Array # [Array] of [String] Array of role object ids
var joined_at: String # When the user joined the guild
var premium_since = null # [String] When the user started boosting the guild
var deaf: bool # Whether the user is deafened in voice channels
var mute: bool # Whether the user is muted in voice channels
var pending = null # [bool] Whether the user has not yet passed the guild's Membership Screening requirements
var permissions = null # [String] Total permissions of the member in the channel, including overwrites, returned when in the interaction object
var communication_disabled_until = null # [String] When the user's timeout will expire and the user will be able to communicate in the guild again, null or a time in the past if the user is not timed out


# @hidden
func _init().("GuildMember"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("user") and p_dict.user != null:
		user = User.new().from_dict(p_dict.user)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict().duplicate(true)

	if dict.has("user") and dict.user != null:
		dict.user = dict.user.to_dict()

	return dict
