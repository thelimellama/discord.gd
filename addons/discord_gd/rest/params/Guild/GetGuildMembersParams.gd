# Params for get guild members
class_name GetGuildMembersParams extends Dataclass


var limit = null # [String] Max number of members to return (1-100) (default 1)
var after = null # [String] Highest user Id in the previous page (default 0)


# @hidden
func _init().("GetGuildMembersParams", {include_null_in_dict = false}): return self
