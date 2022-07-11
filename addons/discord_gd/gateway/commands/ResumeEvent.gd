# Represents a Discord resume event
class_name ResumeEvent extends DiscordDataclass

var token: String # Session token
var session_id: String # Session id
var seq: int # Last sequence number received


# @hidden
func _init().("ResumeEvent"): return self
