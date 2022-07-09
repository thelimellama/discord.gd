# Params for get guild audit log
class_name GetGuildAuditLogParams extends DiscordDataclass

var user_id = null # [String] Entries from a specific user id `optional`
var action_type = null # [AutoModerationActionTypes] Entries for a specific audit log event `optional`
var before = null # [String] Entries that preceded a specific audit log entry id `optional`
var limit = null # [int] Maximum number of entries (between 1-100) to return, defaults to 50 `optional`


# @hidden
func _init().("GetGuildAuditLogParams"): return self
