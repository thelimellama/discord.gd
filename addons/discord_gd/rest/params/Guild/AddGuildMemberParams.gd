# Params for add guild member
class_name AddGuildMemberParams extends DiscordDataclass


var access_token: String # An OAuth2 access token granted with the `guilds.join` to the bot's application for the user you want to add to the guild
var nick = null # [String] Value to set user's nickname to (requires `MANAGE_NICKNAMES` permission) `optional`
var roles = null # [Array] of [String] Array of role ids the member is assigned (requires `MANAGE_ROLES` permission) `optional`
var mute = null # [bool] Whether the user is muted in voice channels (requires `MUTE_MEMBERS` permission) `optional`
var deaf = null # [bool] Whether the user is deafened in voice channels (requires `DEAFEN_MEMBERS` permission) `optional`

# @hidden
func _init().("AddGuildMemberParams"): return self
