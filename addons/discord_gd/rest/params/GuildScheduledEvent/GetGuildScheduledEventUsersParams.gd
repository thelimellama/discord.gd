# Params for get guild scheduled event users
class_name GetGuildScheduledEventUsersParams extends Dataclass


var limit = null # [int] Number of users to return (up to maximum 100) (default is 100)
var with_member = null # [bool] Include guild member data if it exists (default is false)
var before = null # [String] Consider only users before given user id
var after = null # [String] Consider only users after given user id


# @hidden
func _init().("GetGuildScheduledEventUsersParams", {include_null_in_dict = false}): return self
