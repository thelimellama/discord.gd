# Represents a Discord overwrite
class_name Overwrite extends Dataclass

var id: String # Role or user id
var type: int # Either 0 (role) or 1 (member)
var allow: int # Permission bit set
var deny: int # Permission bit set

# @hidden
func _init().("Overwrite"): return self
