# Params for get guild bans
class_name GetGuildBansParams extends DiscordDataclass

var limit = null # [int] Number of users to return (up to maximum 1000) (default is 1000) `optional`
var before = null # [String] Consider only users before given user id `optional`
var after = null # [String] Consider only users after given user id `optional`

# @hidden
func _init().("GetGuildBansParams"): return self
