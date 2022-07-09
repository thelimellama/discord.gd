# Params for get guild scheduled event users
class_name GetGuildScheduledEventUsersParams extends DiscordDataclass


var limit = null # [int] Number of users to return (up to maximum 100) (default is 100) `optional`
var with_member = null # [bool] Include guild member data if it exists (default is false) `optional`
var before = null # [String] Consider only users before given user id `optional`
var after = null # [String] Consider only users after given user id `optional`


# @hidden
func _init().("GetGuildScheduledEventUsersParams"): return self
