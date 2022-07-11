# Represents a Discord activity party
class_name ActivityParty extends Dataclass


var id = null # [String] The id of the party `optional`
var size = null # [Array] of two integers [current_size, max_size] Used to show the party's current and maximum size `optional`


# @hidden
func _init().("ActivityParty"): return self
