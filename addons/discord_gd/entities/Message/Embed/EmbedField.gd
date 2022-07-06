# Represents a Discord embed field
class_name EmbedField extends Dataclass

var name: String # Name of the field
var value: String # Value of the field
var inline = null # [bool] Whether or not this field should display inline


# @hidden
func _init().("EmbedField"): return self
