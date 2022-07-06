# Represents a Discord message select menu
#
class_name MessageTextInput extends Dataclass

var type: int = 4 # 4 for a text input
var custom_id: String # A developer-defined identifier for the input, max 100 characters
var style: int # [MessageTextInputStyles] The Text Input Style
var label: String # The label for this component, max 45 characters
var min_length = null # [int] The minimum input length for a text input, min 0, max 4000
var max_length = null # [int] The maximum input length for a text input, min 1, max 4000
var required = null # [bool] Whether this component is required to be filled, default true
var value = null # [String] A pre-filled value for this component, max 4000 characters
var placeholder = null # [String] Custom placeholder text if the input is empty, max 100 characters


# @hidden
func _init().("MessageTextInput"): return self
