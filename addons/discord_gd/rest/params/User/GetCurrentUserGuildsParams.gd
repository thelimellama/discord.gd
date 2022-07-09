# Params for get current user guilds
class_name GetCurrentUserGuildsParams extends DiscordDataclass


var before = null # [String] Get guilds before this guild id `optional`
var after = null # [String] Get guilds after this guild id `optional`
var limit = null # [int] Gax number of guilds to return (1-200) (default is 200) `optional`


# @hidden
func _init().("GetCurrentUserGuildsParams"): return self
