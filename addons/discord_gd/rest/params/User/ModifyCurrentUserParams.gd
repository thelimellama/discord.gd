# Params for modify current user
class_name ModifyCurrentUserParams extends DiscordDataclass


var username = null # [String] User's username, if changed may cause the user's discriminator to be randomized `optional`
var avatar = null setget __set_avatar # [String] If passed, modifies the user's avatar (Data URI scheme encoded) `optional` `nullable`


# @hidden
func _init().("ModifyCurrentUserParams"): return self


func __set_avatar(p_avatar):
	__options__.set_props.avatar = true
	avatar = p_avatar
