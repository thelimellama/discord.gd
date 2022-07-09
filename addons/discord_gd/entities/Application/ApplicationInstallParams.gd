# Represents a Discord application install params
class_name ApplicationInstallParams extends DiscordDataclass

var scopes: Array # [Array] of [OAuth2Scopes] The scopes to add the application to the server with
var permissions: Permissions # [Permissions] The permissions to request for the bot role


# @hidden
func _init().("ApplicationInstallParams"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	permissions = Permissions.new(p_dict.permissions)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_bitfield_to_int(dict, "permissions", true)

	return dict
