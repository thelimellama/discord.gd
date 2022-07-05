# Params for get guild audit log
class_name GetGuildAuditLogParams extends Dataclass

var user_id: String # Entries from a specific user ID
var action_type: int # Entries for a specific audit log event
var before: String # Entries that preceded a specific audit log entry ID
var limit: int # Maximum number of entries (between 1-100) to return, defaults to 50


func _init().("GetGuildAuditLogParams"): return self
