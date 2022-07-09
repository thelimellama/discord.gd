# Params for get guild members
class_name GetGuildMembersParams extends DiscordDataclass


var limit = null # [String] Max number of members to return (1-100) (default 1) `optional`
var after = null # [String] Highest user id in the previous page (default 0) `optional`


# @hidden
func _init().("GetGuildMembersParams"): return self
