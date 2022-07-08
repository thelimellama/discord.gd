# Params for get guild prune count
class_name GetGuildPruneCountParams extends Dataclass

var days = null # [int] Number of days to count prune for (1-30) (default is 7)
var include_roles = null # [String] Comma separated list of ids of role(s) to include

# @hidden
func _init().("GetGuildPruneCountParams", {include_null_in_dict = false}): return self
