# Params for begin guild prune
class_name BeginGuildPruneParams extends DiscordDataclass

var days = null # [int] Number of days to prune (1-30) (default is 7) `optional`
var compute_prune_count = null # Whether pruned is returned, discouraged for large guilds (default is true) `optional`
var include_roles = null # [Array] of [String] Ids of role(s) to include `optional`


# @hidden
func _init().("BeginGuildPruneParams"): return self
