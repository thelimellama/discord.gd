# Params for search guild members
class_name SearchGuildMembersParams extends Dataclass


var query: String # Query string to match username(s) and nickname(s) against
var limit = null # [int] Max number of members to return (1-1000) (default 1)


# @hidden
func _init().("SearchGuildMembersParams", {include_null_in_dict = false}): return self
