# Params for get guild bans
class_name GetGuildBansParams extends Dataclass

var limit = null # [int] Number of users to return (up to maximum 1000) (default is 1000)
var before = null # [String] Consider only users before given user id
var after = null # [String] Consider only users after given user id

# @hidden
func _init().("GetGuildBansParams", {include_null_in_dict = false}): return self
