# Params for get guild prune count
class_name GetGuildPruneCountParams extends DiscordDataclass

var days = null # [int] Number of days to count prune for (1-30) (default is 7) `optional`
var include_roles = null # [String] Comma separated list of ids of role(s) to include `optional`

# @hidden
func _init().("GetGuildPruneCountParams"): return self
