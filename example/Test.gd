extends Control

# Testing new stuff (Nothing much here)
func _ready() -> void:
	var flags = Permissions.new()
	print(flags.to_array())
