# Params for add guild member
class_name AddGuildMemberParams extends Dataclass


var access_token: String # An oauth2 access token granted with the `guilds.join` to the bot's application for the user you want to add to the guild
var nick = null # [String] Value to set user's nickname to (requires `MANAGE_NICKNAMES` permission)
var roles = null # [Array] of [String] Array of role ids the member is assigned (requires `MANAGE_ROLES` permission)
var mute = null # [bool] Whether the user is muted in voice channels (requires `MUTE_MEMBERS` permission)
var deaf = null # [bool] Whether the user is deafened in voice channels (requires `DEAFEN_MEMBERS` permission)

# @hidden
func _init().("AddGuildMemberParams", {include_null_in_dict = false}): return self
