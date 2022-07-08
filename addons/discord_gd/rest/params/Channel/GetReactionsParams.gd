# Params for get reactions
class_name GetReactionsParams extends Dataclass


var after = null # [String] Get users after this user Id
var limit = null # [String] Max number of users to return (1-100) (default 25)


# @hidden
func _init().("GetReactionsParams", {include_null_in_dict = false}): return self
