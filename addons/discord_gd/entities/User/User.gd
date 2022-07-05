# Represents a Discord user
class_name User extends Dataclass

var id: String # The user's id
var username: String # The user's username, not unique across the platform
var discriminator: String # The user's 4-digit discord-tag
var avatar = null # [String] The user's avatar hash
var bot = null # [bool] Whether the user belongs to an OAuth2 application
var system = null # [bool] Whether the user is an Official Discord System user (part of the urgent message system)
var mfa_enabled = null # [bool] Whether the user has two factor enabled on their account
var banner = null # [String] The user's banner hash
var accent_color = null # [int] The user's banner color encoded as an integer representation of hexadecimal color code
var locale = null # [String] The user's chosen language option
var verified = null # [bool] Whether the email on this account has been verified
var email = null # [String] The user's email
var flags = null # [UserFlags] The flags on a user's account
var premium_type = null # [int] The type of Nitro subscription on a user's account
var public_flags = null # [UserFlags] The public flags on a user's account


# @hidden
func _init().("User"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("flags"):
		flags = UserFlags.new(p_dict.flags)
	if p_dict.has("public_flags"):
		public_flags = UserFlags.new(p_dict.public_flags)
	return self


# @hidden
func to_dict() ->Dictionary:
	var dict = .to_dict()

	if dict.has("flags"):
		dict.flags = dict.flags.bitfield
	if dict.has("public_flags"):
		dict.public_flags = dict.public_flags.bitfield

	return dict
