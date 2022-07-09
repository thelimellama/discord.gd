# Params for get reactions
class_name GetReactionsParams extends DiscordDataclass


var after = null # [String] Get users after this user id `optional`
var limit = null # [String] Max number of users to return (1-100) (default 25) `optional`


# @hidden
func _init().("GetReactionsParams"): return self
