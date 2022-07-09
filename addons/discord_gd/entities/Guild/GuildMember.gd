# Represents a Discord guild member
class_name GuildMember extends DiscordDataclass


var user = null # [User] The user this guild member represents `optional`
var nick = null # [String] This user's guild nickname `optional` `nullable`
var avatar = null # [String] The member's guild avatar hash `optional` `nullable`
var roles: Array # [Array] of [String] Array of role object ids
var joined_at: String # When the user joined the guild
var premium_since = null # [String] When the user started boosting the guild `optional` `nullable`
var deaf: bool # Whether the user is deafened in voice channels
var mute: bool # Whether the user is muted in voice channels
var pending = null # [bool] Whether the user has not yet passed the guild's Membership Screening requirements `optional`
var permissions = null # [Permissions] Total permissions of the member in the channel, including overwrites, returned when in the interaction object `optional`
var communication_disabled_until = null # [String] When the user's timeout will expire and the user will be able to communicate in the guild again, null or a time in the past if the user is not timed out `optional` `nullable`

var is_pending = null # [bool] (Undocumented) `optional`
var flags = null # [int] (Undocumented) `optional`
var bio = null # [String] (Undocumented) `optional`
var banner = null # [String] (Undocumented) `optional`


# @hidden
func _init().("GuildMember"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("user") and p_dict.user != null:
		user = User.new().from_dict(p_dict.user)
	if p_dict.has("permissions") and p_dict.permissions != null:
		permissions = Permissions.new(p_dict.permissions)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_dataclass_to_dict(dict, "user")
	DiscordUtils.try_bitfield_to_int(dict, "permissions", true)

	return dict
