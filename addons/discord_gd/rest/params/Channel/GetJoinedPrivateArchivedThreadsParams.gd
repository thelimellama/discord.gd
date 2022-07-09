# Params for get joined private archived threads
class_name GetJoinedPrivateArchivedThreadsParams extends DiscordDataclass


var before = null # [String] returns threads before this id `optional`
var limit = null # [int] Maximum number of threads to return `optional`


# @hidden
func _init().("GetJoinedPrivateArchivedThreadsParams"): return self
