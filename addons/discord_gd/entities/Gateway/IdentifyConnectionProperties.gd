# Represents a Discord identify connection properties
class_name IdentifyConnectionProperties extends Dataclass

var os: String # Your operating system
var browser: String # Your library name
var device: String # Your library name

# @hidden
func _init().("IdentifyConnectionProperties"): return self
