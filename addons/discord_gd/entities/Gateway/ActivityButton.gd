# Represents a Discord activity button
class_name ActivityButton extends Dataclass

var label: String # The text shown on the button (1-32 characters)
var url: String # The url opened when clicking the button (1-512 characters)


# @hidden
func _init().("ActivityButton"): return self
