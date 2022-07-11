# Represents a Discord hello event
class_name HelloEvent extends Dataclass

var heartbeat_interval: int # The interval (in milliseconds) the client should heartbeat with

# @hidden
func _init().("HelloEvent"): return self
