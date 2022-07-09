# Params for get public/private archived threads
class_name GetArchivedThreadsParams extends DiscordDataclass


var before = null # [String] Returns threads before this timestamp `optional`
var limit = null # [int] Maximum number of threads to return `optional`


# @hidden
func _init().("GetArchivedThreadsParams"): return self
