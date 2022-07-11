# Represents a Discord activity emoji
class_name ActivityEmoji extends Dataclass

var name: String # The name of the emoji
var id = null # [String] The id of the emoji `optional`
var animated = null # [bool] Whether this emoji is animated `optional`

# @hidden
func _init().("ActivityEmoji"): return self
