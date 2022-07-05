# Represents a Discord thread member
class_name ThreadMember extends Dataclass

var id = null# [String] The id of the thread
var user_id = null# [String] The id of the user
var join_timestamp: String # The time the current user last joined the thread
var flags: int # Any user-thread settings, currently only used for notifications


# @hidden
func _init().("ThreadMember"): return self
