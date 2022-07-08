# Params for get public archived threads
class_name GetArchivedThreadsParams extends Dataclass


var before = null # [String] Returns threads before this timestamp
var limit = null # [int] Maximum number of threads to return


# @hidden
func _init().("GetArchivedThreadsParams", {include_null_in_dict = false}): return self
