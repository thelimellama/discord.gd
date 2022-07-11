# Represents a Discord activity timestamps
class_name ActivityTimestamps extends Dataclass

var start = null # [int] Unix time (in milliseconds) of when the activity started `optional`
var end = null # [int] Unix time (in milliseconds) of when the activity ends `optional`

# @hidden
func _init().("ActivityTimestamps"): return self
