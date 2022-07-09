# Params for modify guild member
class_name ModifyGuildMemberParams extends DiscordDataclass

var nick = null setget __set_nick # [String] Value to set user's nickname to (requires `MANAGE_NICKNAMES` permission) `optional` `nullable`
var roles = null setget __set_roles # [Array] of [String] Array of role ids the member is assigned	(requires `MANAGE_ROLES` permission) `optional` `nullable`
var mute = null setget __set_mute # [bool] Whether the user is muted in voice channels. Will return a 400 [HTTPResponse] if the user is not in a voice channel (requires `MUTE_MEMBERS` permission) `optional` `nullable`
var deaf = null setget __set_deaf # [bool] Whether the user is deafened in voice channels. Will return a 400 [HTTPResponse] if the user is not in a voice channel	(requires `DEAFEN_MEMBERS` permission) `optional` `nullable`
var channel_id = null setget __set_channel_id # [String] Id of channel to move user to (if they are connected to voice) (requires `MOVE_MEMBERS` permission) `optional` `nullable`
var communication_disabled_until = null setget __set_communication_disabled_until # [String] When the user's timeout will expire and the user will be able to communicate in the guild again (up to 28 days in the future), set to null to remove timeout. Will throw a 403 [HTTPResponse] if the user has the `ADMINISTRATOR` permission or is the owner of the guild (requires the `MODERATE_MEMBERS` permission) `optional` `nullable`


# @hidden
func _init().("ModifyGuildMemberParams"): return self


func __set_nick(p_nick):
	__options__.set_props.nick = true
	nick = p_nick


func __set_roles(p_roles):
	__options__.set_props.roles = true
	roles = p_roles


func __set_mute(p_mute):
	__options__.set_props.mute = true
	mute = p_mute


func __set_deaf(p_deaf):
	__options__.set_props.deaf = true
	deaf = p_deaf


func __set_channel_id(p_channel_id):
	__options__.set_props.channel_id = true
	channel_id = p_channel_id


func __set_communication_disabled_until(p_communication_disabled_until):
	__options__.set_props.communication_disabled_until = true
	communication_disabled_until = p_communication_disabled_until
