# Params for begin guild prune
class_name BeginGuildPruneParams extends Dataclass

var days = null # [int] Number of days to prune (1-30) (default is 7)
var compute_prune_count = null # Whether pruned is returned, discouraged for large guilds (default is true)
var include_roles = null # [Array] of [String] Ids of role(s) to include


# @hidden
func _init().("BeginGuildPruneParams", {include_null_in_dict = false}): return self
