# Represents a Discord message activity
class_name MessageActivity extends Dataclass

var type: int # [MessageActivityTypes] Type of message activity
var party_id = null # [String] Party_id from a Rich Presence event


# @hidden
func _init().("MessageActivity"): return self
